--- WindowMaker/menu.sl.orig	2015-08-11 18:41:14 UTC
+++ WindowMaker/menu.sl
@@ -125,7 +125,7 @@
 		"LyX" EXEC lyx
 		"Netscape" EXEC netscape 
   		"Ghostview" EXEC ghostview %a(Enter file to view)
-		"Acrobat" EXEC /usr/local/Acrobat3/bin/acroread %a(Enter PDF to view)
+		"Acrobat" EXEC PREFIX/Acrobat3/bin/acroread %a(Enter PDF to view)
   		"TkDesk" EXEC tkdesk
 	"Aplikacije" END
 	"Urejevalniki besedil" MENU
