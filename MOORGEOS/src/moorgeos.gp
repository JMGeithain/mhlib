name moorgeos.app

longname "MoorGEOS"

tokenchars "MGRS"
tokenid 16425

type appl, process, single
class MoorGEOSProcessClass
appobj MoorGEOSApp

export MoorGEOSBoardClass

library geos
library ui

resource AppResource object
resource Interface object
resource BoardBlock object
