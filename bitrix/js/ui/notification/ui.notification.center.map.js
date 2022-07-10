{"version":3,"sources":["ui.notification.center.js"],"names":["BX","namespace","instance","Object","defineProperty","UI","Notification","enumerable","get","Manager","this","stacks","create","balloons","balloonDefaults","stackDefaults","defaultPosition","Position","TOP_RIGHT","addCustomEvent","Event","getFullName","handleBalloonClose","bind","prototype","notify","options","type","isPlainObject","currentBalloon","getBalloonById","id","getBalloonByCategory","category","setOptions","show","blinkOnUpdate","update","blink","stack","Stack","addStack","isNotEmptyString","position","getStackByPosition","getDefaultStack","balloonOptions","mergeEx","getBalloonDefaults","balloonType","getBalloonType","balloon","Balloon","Error","getId","balloonId","getCategory","removeBalloon","event","getBalloon","getStack","stackId","getDefaultPosition","getStackDefaults","setBalloonDefaults","setStackDefaults","getPositionCode","code","setDefaultPosition"],"mappings":"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","file":"ui.notification.center.map.js"}