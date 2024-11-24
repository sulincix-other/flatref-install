build:
	: no build
install:
	mkdir -p $(DESTDIR)/usr/bin $(DESTDIR)/usr/share/applications $(DESTDIR)/usr/share/icons/hicolor/scalable/mimetypes/
	install main.sh $(DESTDIR)/usr/bin/flatref-install
	install application.desktop $(DESTDIR)/usr/share/applications/flatref-install.desktop
	install icon.svg $(DESTDIR)/usr/share/icons/hicolor/scalable/mimetypes/application-vnd-flatpak.svg
