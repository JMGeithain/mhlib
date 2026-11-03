name moorgeos.app

longname "GeoMoorhuhn lite"

tokenchars "MHun"
tokenid 16506

type appl, process, single
class MoorGEOSProcessClass
appobj MoorGEOSApp

export MoorGEOSBoardClass

library geos
library ui

resource AppResource ui-object
resource AppMonikerResource lmem, read-only, shared
resource Interface ui-object
resource BoardBlock object
