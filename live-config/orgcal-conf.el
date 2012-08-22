;; - Set `org-caldav-url' to the base address of your CalDAV server:
;;    * Owncloud: https://OWNCLOUD-SERVER-URL/remote.php/caldav/calendars/USERID
;;    * Google: https://www.google.com/calendar/dav
;;
;; - Set `org-caldav-calendar-id' to the calendar-id of your new calendar:
;;    * OwnCloud: Simply the name of the calendar.
;;    * Google: Click on 'calendar settings' and the id will be shown
;;      next to "Calendar Address". It is of the form
;;      ID@group.calendar.google.com. Do *not* omit the domain.
;;
;; - Set `org-caldav-files' to the list of org files you would like to
;;   sync. For everything else, you can use the org-icalendar-*
;;   variables, since org-caldav uses that package to generate the
;;   events.
;;
;; - Set `org-caldav-inbox' to an org filename where new entries from
;;   the calendar should be stored.
;;
;; Call `org-caldav-sync' to start the sync. The URL package will ask
;; you for username/password for accessing the calendar.
;;;

(require 'url-dav)
(require 'org-caldav)

(setq org-caldav-url "https://www.google.com/calendar/dav")
