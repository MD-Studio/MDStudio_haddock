# -*- coding: utf-8 -*-

import os
import sys

from mdstudio.runner import main

# Try import package
try:
    from mdstudio_haddock.haddock_wamp_endpoints import HaddockComponent

except ImportError:

    # Add modules in package to path
    modulepath = os.path.abspath(os.path.join(os.path.dirname(__file__), '../'))
    if modulepath not in sys.path:
        sys.path.insert(0, modulepath)

    from mdstudio_haddock.haddock_wamp_endpoints import HaddockComponent


if __name__ == '__main__':
    main(HaddockComponent)
