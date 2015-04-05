;--------------------------------------------------
;calendar
(setq appt-issue-message t) ; 约会提醒功能
(setq appt-message-warning-time 5)
(setq appt-display-interval 5)
(appt-activate 3)

(setq diary-file "/data/backup/diary")
(setq diary-mail-addr "heihe_yellow@163.com")
(add-hook 'diary-hook 'appt-make-list)

(global-set-key (kbd "<f11>") 'calendar)

;;设置所在地的经纬度和地名，calendar 可以根据这些信息告知你每天的
;;日出和日落的时间。在 calendar 上用 S 即可看到
(setq calendar-latitude +28.2)
(setq calendar-longitude +112.9)
(setq calendar-location-name "ChangSha")
   
(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1)

;; Calendar 中 p C 可以看到我们的阴历有中文的天干地支。
(setq chinese-calendar-celestial-stem
      ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch
      ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

;;设置日历的一些颜色
(setq calendar-load-hook
'(lambda ()
(set-face-foreground 'diary-face "yellow")
(set-face-background 'diary-face "blue")))

;;日历中突出标记日记
(setq mark-diary-entries-in-calendar t)
;;日历中突出标记节日和生日
(setq mark-holidays-in-calendar t)
;;打开calendar自动打开节日和生日列表
(setq view-calendar-holidays-initially t)
;节日
(setq holiday-general-holidays nil)
(setq holiday-local-holidays nil) 
(setq holiday-bahai-holidays nil) 
(setq holiday-christian-holidays nil) ;;不过基督教的节日
(setq holiday-hebrew-holidays nil) ;;不过希伯来人的节日 
(setq holiday-islamic-holidays nil) ;;不过伊斯兰教的节日 
(setq holiday-solar-holidays nil) ;;不过太阳节
(setq holiday-other-holidays
        '(
		       (holiday-fixed 1 1 "元旦")
			 (holiday-fixed 2 14 "情人节")
		         (holiday-fixed 3 8 "妇女节")
			 (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-float 6 0 3 "父亲节")
		         (holiday-fixed 7 20 "结婚纪念")
		         (holiday-fixed 9 10 "教师节")
			 (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 10 31 "万圣节")
                         (holiday-fixed 11 20 "我的生日")
			 (holiday-fixed 12 2 "老爸生日")
                         (holiday-fixed 12 18 "女朋友生日")
                         (holiday-fixed 12 25 "圣诞节")
	  (holiday-chinese 1 1 "春节 (正月初一)")
	  (holiday-chinese 1 15 "元宵节 (正月十五)")
          (holiday-chinese 3 16 "老妈生日 (三月十六)")
          (holiday-chinese 3 27 "姐姐生日 (三月廿七)")
          (holiday-chinese 5  5 "端午节 (五月初五)")
          (holiday-chinese 9  9 "重阳节 (九月九)")
          (holiday-chinese 8 15 "中秋节 (八月十五)")
	  (holiday-chinese 10 7 "泰山生日 (十月初七)")
          (holiday-chinese 11 6 "岳母生日 (十一月初六)")
          (holiday-chinese 12 2 "老爸生日 (十二月初二)")	  
		  ))

; (autoload 'chinese-year "cal-china" "Chinese year data" t)
;   
;   (defun holiday-chinese (cmonth cday string)
;     (let* ((m displayed-month)
;          (y displayed-year)
;          (gdate (calendar-gregorian-from-absolute
;                  (+ (cadr (assoc cmonth (chinese-year y))) (1- cday)))))
;       (increment-calendar-month m y (- 11 (car gdate)))
;       (if (> m 9) (list (list gdate string)))))
(setq calendar-chinese-all-holidays-flag t)
(setq calendar-holidays
'(
 (holiday-fixed 1 1 "元旦 New Year's Day")
 (holiday-fixed 2 14 "情人节 Valentine's Day")
 (holiday-fixed 4 1 "愚人节 April Fools' Day")
 (holiday-float 5 0 2 "母亲节 Mother's Day")
 (holiday-float 6 0 3 "父亲节 Father's Day")
 (holiday-fixed 7 20 "领结婚证纪念")
 (holiday-fixed 10 6 "结婚典礼纪念")
 (holiday-fixed 10 9 "结婚典礼纪念")
 (holiday-fixed 10 31 "万圣节 Halloween")
 (holiday-float 11 4 4 "感恩节 Thanksgiving")
 (holiday-fixed 12 25 "圣诞节 Christmas")
 (holiday-chinese-new-year)
			   (holiday-fixed 3 8 "妇女节")
			   (holiday-fixed 5 1 "劳动节")
			   (holiday-fixed 9 10 "教师节")
			   (holiday-fixed 10 1 "国庆节")
			   (holiday-fixed 11 20 "我的生日")
			   (holiday-fixed 12 2 "老爸生日 (主为阳历)")
			   (holiday-fixed 12 18 "老婆生日")
			   (holiday-chinese 1 1 "春节 (正月初一)")
			   (holiday-chinese 3 16 "老妈生日 (三月十六)")
			   (holiday-chinese 3 27 "姐姐生日 (三月廿七)")
			   (holiday-chinese 10 7 "岳父生日 (十月初七)")
			   (holiday-chinese 11 6 "岳母生日 (十一月初六)")
 (if calendar-chinese-all-holidays-flag
     (append
      (holiday-chinese 1 15 "元霄节 Lantern Festival")
      (holiday-chinese-qingming)
      (holiday-chinese 5 5 "端午节 Dragon Boat Festival")
      (holiday-chinese 7 7 "七夕节 Double Seventh Festival")
      (holiday-chinese 8 15 "中秋节 Mid-Autumn Festival")
      (holiday-chinese 9 9 "重阳节 Double Ninth Festival")
      (holiday-chinese-winter-solstice)))
))
