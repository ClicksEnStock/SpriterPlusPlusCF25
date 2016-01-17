        ��  ��                  �      �� ��     0 	        �4   V S _ V E R S I O N _ I N F O     ���                                           S t r i n g F i l e I n f o   �   0 4 0 9 0 4 e 4   4 
  C o m p a n y N a m e     C l i c k t e a m   @   F i l e D e s c r i p t i o n     E d i f   O b j e c t   *   F i l e V e r s i o n     2 . 0 0     0   I n t e r n a l N a m e   E d i f E x t   Z   L e g a l C o p y r i g h t   C o p y r i g h t   �   2 0 1 2   C l i c k t e a m     @   O r i g i n a l F i l e n a m e   E d i f E x t . m f x   :   P r o d u c t V e r s i o n   1 ,   0 ,   0 ,   1     2 	  S p e c i a l B u i l d   0 0 0 0 0 0 0 1     D    V a r F i l e I n f o     $    T r a n s l a t i o n     	�       ��
 ���     0 	        %YI8  (   E D I F   ��f       0 	        {
    "About": {
        "Name": "Spriter Object",
        "Author": "ConceptGame",
        "Copyright": "Copyright (C) 2014 ConceptGame",
        "Comment": "Procedural animation object based on Spriter format (v0.8)",
        "URL": "http://www.example.com",
        "Help": "Help/Spriter.chm",
        "Identifier": "SPRI"
    },
    "ActionMenu": [
        [
            "Scale / Angle",
            [
                7,
                "Set Scale"
            ],
            [
                8,
                "Set Angle"
            ]
        ],
        "Separator",
        [
            "Entity",
            [
                11,
                "Change Entity by number"
            ]
        ],
        [
            "Animation",
            [
                0,
                "Stop Animation"
            ],
            [
                1,
                "Start Animation"
            ],
            [
                2,
                "Change Animation by name"
            ],
            [
                12,
                "Change Animation by name with blending"
            ],
            [
                3,
                "Change Animation Time"
            ],
            [
                4,
                "Change horizontal flipping"
            ],
            [
                5,
                "Set speed ratio"
            ]
        ],
        [
            "Character Map",
            [
                6,
                "Apply Character Map"
            ],
            [
                13,
                "Remove Character Map"
            ],
            [
                14,
                "Remove All Character Maps"
            ]
        ],
        [
            "Sprites",
            [
                9,
                "Load 1 Sprite from Active"
            ],
            [
                10,
                "Load Ordered Sprites from active per animation"
            ],
            [
                18,
                "Load Ordered Sprites from active per direction"
            ]
        ],
        [
            "Boxes",
            [
                15,
                "Bound Box to Object"
            ],
            [
                16,
                "Unbound Box from Object"
            ]
        ],
        [
            "Debug",
            [
                17,
                "Set debug display"
            ]
        ],
        "Separator"
    ],
    "ConditionMenu": [
        [
            "Animation",
            [
                0,
                "Is animation playing (by name)?"
            ],
            [
                1,
                "Has animation finished?"
            ],
            [
                2,
                "Compare current time to value"
            ],
            [
                3,
                "Is tag active?"
            ],
            [
                4,
                "Is object tag active?"
            ]
        ],
        [
            "Events",
            [
                5,
                "On Sound Event"
            ],
            [
                6,
                "On Trigger Event"
            ]
        ]
    ],
    "ExpressionMenu": [
        [
            "Scale / Angle",
            [
                1,
                "Scale"
            ],
            [
                2,
                "Angle"
            ]
        ],
        [
           0,
           "Last Error"
        ],
        [
            "Animation",
            [
                3,
                "Current Time"
            ],
            [
                4,
                "Current Speed Ratio"
            ],
            [
                5,
                "Current Animation"
            ]
        ],
        [
            "Variable",
            [
                6,
                "Real Value"
            ],
            [
                7,
                "Object Real Value"
            ],
            [
                8,
                "Integer Value"
            ],
            [
                9,
                "Object Integer Value"
            ],
            [
                10,
                "String Value"
            ],
            [
                11,
                "Object String Value"
            ]
        ],
        [
            "Point",
            [
                12,
                "Position X"
            ],
            [
                13,
                "Position Y"
            ],
            [
                14,
                "Direction"
            ]
        ]
    ],
    "Actions": [
        {
            "Title": "Stop Animation"
        },
        {
            "Title": "Start Animation"
        },
        {
            "Title": "Change Animation to %0",
            "Parameters": [
                [
                    "Text",
                    "Animation Name"
                ]
            ]
        },
        {
            "Title": "Change Current Animation Time to %0",
            "Parameters": [
                [
                    "Integer",
                    "Time (ms)"
                ]
            ]
        },
        {
            "Title": "Set FlipX to %0",
            "Parameters": [
                [
                    "Integer",
                    "FlipX status (0=disabled, >0=enabled)"
                ]
            ]
        },
        {
            "Title": "Set animation speed ratio to %0",
            "Parameters": [
                [
                    "Float",
                    "Speed ratio (1=normal, ]0,1]=slower, >1=faster)"
                ]
            ]
        },
        {
            "Title": "Apply Character Map %0",
            "Parameters": [
                [
                    "Text",
                    "Character Map Name"
                ]
            ]
        },
        {
            "Title": "Set scale to %0",
            "Parameters": [
                [
                    "Float",
                    "Scale (both X and Y axes)"
                ]
            ]
        },
        {
            "Title": "Set angle to %0",
            "Parameters": [
                [
                    "Float",
                    "Angle"
                ]
            ]
        },
        {
            "Title": "Load 1 sprite from %0 by animation %1 at %2 on frame %3",
            "Parameters": [
                [
                    "Object",
                    "Active object"
                ],
                [
                    "Integer",
                    "Animation number of object to load from"
                ],
                [
                    "NewDirection",
                    "Direction of object to load from"
                ],
                [
                    "Integer",
                    "Animation frame number to load from"
                ]
            ]
        },
        {
            "Title": "Load ordered sprites from %0 by animation %1",
            "Parameters": [
                [
                    "Object",
                    "Active object"
                ],
                [
                    "Integer",
                    "Animation number of object to load from"
                ]
            ]
        },
        {
            "Title": "Change Entity to %0",
            "Parameters": [
                [
                    "Integer",
                    "Entity Number"
                ]
            ]
        },
        {
            "Title": "Change Animation to %0 in %1 ms",
            "Parameters": [
                [
                    "Text",
                    "Animation Name"
                ],
                [
                    "Integer",
                    "Blending time in ms"
                ]
            ]
        },
        {
            "Title": "Remove Character Map %0",
            "Parameters": [
                [
                    "Text",
                    "Character Map Name"
                ]
            ]
        },
        {
            "Title": "Remove All Character Maps"
        },
        {
            "Title": "Bound box %0 to %1",
            "Parameters": [
                [
                    "Text",
                    "Box Name"
                ],
                [
                    "Object",
                    "Active object"
                ]
            ]
        },
        {
            "Title": "Unbound box %0",
            "Parameters": [
                [
                    "Text",
                    "Box Name"
                ]
            ]
        },
        {
            "Title": "Set Debug to ShowBones=%0, ShowBoxes=%1, ShowPoints=%2",
            "Parameters": [
                [
                    "Integer",
                    "Show Bones (0=hide, >0=display)"
                ],
                [
                    "Integer",
                    "Show Boxes (0=hide, >0=display)"
                ],
                [
                    "Integer",
                    "Show Points (0=hide, >0=display)"
                ]
            ]
        },
        {
            "Title": "Load ordered sprites from %0 by animation %1 and direction %2",
            "Parameters": [
                [
                    "Object",
                    "Active object"
                ],
                [
                    "Integer",
                    "Animation number of object to load from"
                ],
                [
                    "Integer",
                    "Direction number in animation (0->32)"
                ]
            ]
        },
    ],
    "Conditions": [
        {
            "Title": "%o : Is %0 animation playing?",
            "Parameters": [
                [
                    "Text",
                    "Animation name"
                ]
            ],
            "Triggered": false
        },
        {
            "Title": "%o : Has current animation finished?",
            "Triggered": false
        },
        {
            "Title": "%o : Is Current Time %0?",
            "Parameters": [
                [
                    "Comparison",
                    "Time (ms)"
                ]
            ],
            "Triggered": false
        },
        {
            "Title": "%o : Is tag %0 active?",
            "Parameters": [
                [
                    "Text",
                    "tag name"
                ]
            ],
            "Triggered": false
        },
        {
            "Title": "%o : Is %0 tag %1 active?",
            "Parameters": [
                [
                    "Text",
                    "object name"
                ],
                [
                    "Text",
                    "tag name"
                ]
            ],
            "Triggered": false
        },
        {
            "Title": "%o : On Sound %0",
            "Parameters": [
                [
                    "Text",
                    "sound name"
                ]
            ],
            "Triggered": false
        },
        {
            "Title": "%o : On Trigger %0",
            "Parameters": [
                [
                    "Text",
                    "trigger name"
                ]
            ],
            "Triggered": false
        }
    ],
    "Expressions": [
        {
            "Title": "LastError$(",
            "Returns": "Text"
        },
        {
            "Title": "CurrentAnim(",
            "Returns": "Integer"
        },
        {
            "Title": "Scale(",
            "Returns": "Float"
        },
        {
            "Title": "Angle(",
            "Returns": "Float"
        },
        {
            "Title": "CurrentTime(",
            "Returns": "Float"
        },
        {
            "Title": "CurrentSpeedRatio(",
            "Returns": "Float"
        },
        {
            "Title": "CurrentAnimation$(",
            "Returns": "Text"
        },
        {
            "Title": "RealValue(",
            "Parameters": [
                [
                    "Text",
                    "variable name"
                ]
            ],
            "Returns": "Float"
        },
        {
            "Title": "ObjectRealValue(",
            "Parameters": [
                [
                    "Text",
                    "object name"
                ]
            ],
            "Parameters": [
                [
                    "Text",
                    "variable name"
                ]
            ],
            "Returns": "Float"
        },
        {
            "Title": "IntValue(",
            "Parameters": [
                [
                    "Text",
                    "variable name"
                ]
            ],
            "Returns": "Integer"
        },
        {
            "Title": "ObjectIntValue(",
            "Parameters": [
                [
                    "Text",
                    "object name"
                ]
            ],
            "Parameters": [
                [
                    "Text",
                    "variable name"
                ]
            ],
            "Returns": "Integer"
        },
        {
            "Title": "StringValue$(",
            "Parameters": [
                [
                    "Text",
                    "variable name"
                ]
            ],
            "Returns": "Text"
        },
        {
            "Title": "ObjectStringValue$(",
            "Parameters": [
                [
                    "Text",
                    "object name"
                ]
            ],
            "Parameters": [
                [
                    "Text",
                    "variable name"
                ]
            ],
            "Returns": "Text"
        },
        {
            "Title": "PointX(",
            "Parameters": [
                [
                    "Text",
                    "point name"
                ]
            ],
            "Returns": "Integer"
        },
        {
            "Title": "PointY(",
            "Parameters": [
                [
                    "Text",
                    "point name"
                ]
            ],
            "Returns": "Integer"
        },
        {
            "Title": "PointDir(",
            "Parameters": [
                [
                    "Text",
                    "point name"
                ]
            ],
            "Returns": "Float"
        }
    ]
}
   &       �� ��     0	           M F 2                               L       �� ��     0	                         S p r i t e r   F i l e s | * . s c m l | |               