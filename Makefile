CONFIGURATION=Release

ADDIN_NAME=DefaultDesigner

MDTOOL ?= /Applications/Xamarin\ Studio.app/Contents/MacOS/mdtool


all : clean Build/$(CONFIGURATION)/$(ADDIN_NAME).mpack

Build/$(CONFIGURATION) :
	mkdir -p Build/$(CONFIGURATION)

Build/$(CONFIGURATION)/$(ADDIN_NAME).dll : Build/$(CONFIGURATION)
	cd $(ADDIN_NAME) && XBuild /p:Configuration=$(CONFIGURATION)
	cp $(ADDIN_NAME)/bin/$(CONFIGURATION)/$(ADDIN_NAME).dll Build/$(CONFIGURATION)

Build/$(CONFIGURATION)/$(ADDIN_NAME).mpack : Build/$(CONFIGURATION)/$(ADDIN_NAME).dll
	cd Build/$(CONFIGURATION) && $(MDTOOL) setup pack $(ADDIN_NAME).dll

clean :
	rm -rf Build
	rm -rf $(ADDIN_NAME)/bin
	rm -rf $(ADDIN_NAME)/obj