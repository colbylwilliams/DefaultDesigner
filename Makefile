CONFIGURATION=Release

ADDIN_NAME=DefaultDesigner

VSTOOL ?= /Applications/Visual\ Studio.app/Contents/MacOS/vstool


all : clean Build/$(CONFIGURATION)/$(ADDIN_NAME).mpack

Build/$(CONFIGURATION) :
	mkdir -p Build/$(CONFIGURATION)

Build/$(CONFIGURATION)/$(ADDIN_NAME).dll : Build/$(CONFIGURATION)
	cd $(ADDIN_NAME) && msbuild /p:Configuration=$(CONFIGURATION)
	cp $(ADDIN_NAME)/bin/$(CONFIGURATION)/$(ADDIN_NAME).dll Build/$(CONFIGURATION)

Build/$(CONFIGURATION)/$(ADDIN_NAME).mpack : Build/$(CONFIGURATION)/$(ADDIN_NAME).dll
	cd Build/$(CONFIGURATION) && $(VSTOOL) setup pack $(ADDIN_NAME).dll

clean :
	rm -rf Build
	rm -rf $(ADDIN_NAME)/bin
	rm -rf $(ADDIN_NAME)/obj