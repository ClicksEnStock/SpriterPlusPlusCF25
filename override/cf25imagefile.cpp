#include "cf25imagefile.h"

#include "spriterengine/global/settings.h"

#include "spriterengine/objectinfo/universalobjectinterface.h"

namespace SpriterEngine
{

	Cf25ImageFile::Cf25ImageFile(std::string initialFilePath, point initialDefaultPivot, LPRDATA rdPtr, Extension *ext) :
		ImageFile(initialFilePath,initialDefaultPivot),
		rdPtr(rdPtr), ext(ext)
	{
	}

	Cf25ImageFile::~Cf25ImageFile()
	{
		if (sprite.IsValid())
		{
			sprite.Delete();
		}
	}

	void Cf25ImageFile::renderSprite(UniversalObjectInterface * spriteInfo)
	{
		//if not loaded yet and sprite source is not empty and the corresponding sprite exists, load the sprite
		if (ext->SpriteSource.size()>0 && ext->SpriteSource.count(path()) && !ext->SpriteSource[path()].loaded)
		{
			cSurface source;
			//if external sprite, load it into surface
			if (ext->SpriteSource[path()].external)
			{
				std::wstring ws;
				std::wstring fullPath;
				string filepath = path();
				ws.assign(filepath.begin(), filepath.end());
				fullPath = ext->SpriteSource[path()].path;
				if (ext->LoadImageFile(rdPtr->rHo.hoAdRunHeader->rh4.rh4Mv, sprite, fullPath))
				{
					ext->SpriteSource[path()].loaded = true;
				}
				else
				{
					//set error
				}
			}
			//if the sprite from the active object is available and exists, clone it and release active object sprite
			else if (LockImageSurface(ext->SpriteSource[path()].pObj->roHo.hoAdRunHeader->rhIdAppli, ext->SpriteSource[path()].imageNumber, source))
			{
				sprite.Clone(source);
				ext->SpriteSource[path()].loaded = true;
				UnlockImageSurface(source);
			}
		}

		int w = sprite.GetWidth();
		int h = sprite.GetHeight();
		float posX = spriteInfo->getPivot().x*w;
		float posY = spriteInfo->getPivot().y*h;
		POINT center = { (LONG)posX, (LONG)posY };
		
		DWORD flags = rdPtr->rs->rsEffect & EFFECTFLAG_ANTIALIAS ? (STRF_RESAMPLE_TRANSP) : 0UL;
		LPSURFACE psw = WinGetSurface((int)rdPtr->rHo.hoAdRunHeader->rhIdEditWin);
		double alpha = spriteInfo->getAlpha();
		DWORD dwEffect = rdPtr->rs->rsEffect;// dwEffect et dwEffectParam = values to pass to BlitEx
		DWORD dwEffectParam = rdPtr->rs->rsEffectParam;
		DWORD dwRGBAOld = 0;// to restore old alpha value
		CEffectEx* pEffectEx = NULL;
		if (alpha != 1.0)
		{
			DWORD objectAlpha = 255;
			switch (dwEffect & BOP_MASK) {

				// Shader -> RGBA coefficient is stored in the effect
			case BOP_EFFECTEX:
			{
				pEffectEx = (CEffectEx*)dwEffectParam;
				if (pEffectEx != NULL)
				{
					// Get alpha coef
					dwRGBAOld = pEffectEx->GetRGBA();
					objectAlpha = (dwRGBAOld >> 24);

					// Apply sprite alpha
					objectAlpha = (DWORD)(objectAlpha * alpha);

					// Modify effect alpha
					pEffectEx->SetRGBA((dwRGBAOld & 0x00FFFFFF) | (objectAlpha << 24));
				}
			}
			break;

			// Legacy semi-transparency => the old semitransparency coefficient is in effectParam
			case BOP_BLEND:
				// Convert legacy semi-transp coef into alpha coef
				#define SEMITRANSPTOALPHA(s) ((s==128) ? 0:(255-s*2))
				objectAlpha = SEMITRANSPTOALPHA(dwEffectParam);

				// Apply sprite alpha
				objectAlpha = (DWORD)(objectAlpha * alpha);

				// Store as RGBA coefficient in effectParam
				dwEffect &= ~BOP_MASK;
				dwEffect |= (BOP_COPY | BOP_RGBAFILTER);
				dwEffectParam = (0x00FFFFFF | (objectAlpha << 24));
				break;

				// Other effect
			default:
				// effectParam = RGBA coef?
				if (dwEffect & BOP_RGBAFILTER)
				{
					// Get alpha
					objectAlpha = (((DWORD)dwEffectParam) >> 24);

					// Apply sprite alpha
					objectAlpha = (DWORD)(objectAlpha * alpha);

					// Set alpha in RGBA coef
					dwEffectParam = ((dwEffectParam & 0x00FFFFFF) | (objectAlpha << 24));
				}

				// No
				else
				{
					// Apply alpha to 255
					objectAlpha *= alpha;

					// Store RGBA coef in effectParam
					dwEffectParam = (0x00FFFFFF | (objectAlpha << 24));
					dwEffect |= BOP_RGBAFILTER;
				}
				break;
			}
		}

		// Blit sprite
		sprite.BlitEx(*psw, spriteInfo->getPosition().x, spriteInfo->getPosition().y,
			spriteInfo->getScale().x, spriteInfo->getScale().y, 0, 0, w, h, &center, (float)toDegrees(spriteInfo->getAngle()),
			(dwEffect & EFFECTFLAG_TRANSPARENT) ? BMODE_TRANSP : BMODE_OPAQUE,
			BlitOp(dwEffect & EFFECT_MASK),dwEffectParam, flags);

		// Restore effect alpha if it was modified
		if (pEffectEx != NULL)
			pEffectEx->SetRGBA(dwRGBAOld);
				
		//calculate display rectangle
		RECT minR = { 0, 0, 0, 0 };
		POINT inPoints[4];
		POINT outPoints[4];
		inPoints[0] = { -center.x, -center.y };
		inPoints[1] = { -center.x, (1 - spriteInfo->getPivot().y)*h };
		inPoints[2] = { (1 - spriteInfo->getPivot().x)*w, -center.y };
		inPoints[3] = { (1 - spriteInfo->getPivot().x)*w, (1 - spriteInfo->getPivot().y)*h };
		for (int i = 0; i < 4; i++)
		{
			outPoints[i].x = (inPoints[i].x* spriteInfo->getScale().x * std::cos(spriteInfo->getAngle())) + (inPoints[i].y * spriteInfo->getScale().y * std::sin(spriteInfo->getAngle()));
			outPoints[i].y = (-inPoints[i].x * spriteInfo->getScale().x * std::sin(spriteInfo->getAngle())) + (inPoints[i].y * spriteInfo->getScale().y * std::cos(spriteInfo->getAngle()));
			outPoints[i].x += spriteInfo->getPosition().x;
			outPoints[i].y += spriteInfo->getPosition().y;
		}
		minR.left = min(min(min(outPoints[0].x, outPoints[1].x), outPoints[2].x), outPoints[3].x);
		minR.right = max(max(max(outPoints[0].x, outPoints[1].x), outPoints[2].x), outPoints[3].x);
		minR.top = min(min(min(outPoints[0].y, outPoints[1].y), outPoints[2].y), outPoints[3].y);
		minR.bottom = max(max(max(outPoints[0].y, outPoints[1].y), outPoints[2].y), outPoints[3].y);
		ext->displayRect.left = min(ext->displayRect.left, minR.left);
		ext->displayRect.right = max(ext->displayRect.right, minR.right);
		ext->displayRect.bottom = max(ext->displayRect.bottom, minR.bottom);
		ext->displayRect.top = min(ext->displayRect.top, minR.top);
	}
}
