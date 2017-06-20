.PHONY: all install clean

all:
	msbuild /warnaserror /nowarn:MSB3276,MSB3277 /p:Configuration=Release NameTag.sln
	mkdir -p GameData/NameTag
	python tools/ksp-avc.py `tools/version.sh` > GameData/NameTag/NameTag.version
	cp LICENSE.md CHANGELOG.md src/bin/Release/NameTag.dll src/module-manager.cfg GameData/NameTag/
	zip -r NameTag-`tools/version.sh`.zip GameData

install:
	tools/install.sh

clean:
	rm -rf src/bin src/obj GameData NameTag-*.zip
