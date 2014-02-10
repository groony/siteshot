        innerHTML: '<head>\n    <meta charset="utf-8">\n\n    <title ng-bind="$root.title"></title>\n\n    <!-- Данное значение часто используют поисковые системы, заполняем ответственно -->\n    <meta name="description" content="">\n    <!-- Адаптируем страницу для мобильных устройств -->\n    <meta name="viewport" content="width=1024, maximum-scale=2.0">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n    <meta name="description" content="Карта Труда - поиск вакансий рабочих специальностей.\nИнформационные терминалы по поиску работы в регионах.\nПоиск рабочих специальностей.">\n    <meta name="geo.region" content="RU">\n    <meta name="keywords" content="kartatruda.ru,картатруда.ру,карта,труд,рабочие,специальности,поиск,терминалы,информационные,вахта">\n    <meta name="geo.placename" content="Вешки">\n    <meta name="geo.position" content="55.928733;37.616887">\n    <meta name="ICBM" content="55.928733, 37.616887">\n\n    <!-- Традиционная иконка сайта, размер 16x16, прозрачность поддерживается. Рекомендуемый формат: .ico -->\n    <link rel="shortcut icon" href="/favicon.ico">\n\n    <!-- Иконка сайта для устройств от Apple, рекомендуемый размер 114x114, прозрачность не поддерживается -->\n    <link rel="apple-touch-icon" href="/apple-touch-icon.png">\n    <style media="screen" type="text/css">@import url(http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&subset=latin,cyrillic-ext);</style>\n    <link rel="stylesheet" type="text/css" href="/css/app.min.css">\n    <!--\n    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />\n    <link rel="stylesheet" type="text/css" href="/css/bootstrap-theme.css" />\n    <link rel="stylesheet" type="text/css" href="/css/style.css" />\n    <link rel="stylesheet" type="text/css" href="/css/custom.css" />\n    <link rel="stylesheet" type="text/css" href="/css/animation.css" />\n    <link rel="stylesheet" type="text/css" href="/bower_components/ngprogress-lite/ngprogress-lite.css" />\n    <link rel="stylesheet" type="text/css" href="/bower_components/leaflet-dist/leaflet.css" />\n    -->\n</head>\n\n<body>\n  <div class="region-popup hover" ng-show="$root.regionFlag" ng-cloak="">\n      <p ng-cloak="">{{$root.regionMsg}}</p>\n      <span ng-repeat="reg in $root.regions track by $index" class="region-item" ng-click="$root.setRegion(reg.id)" ng-show="$root.regionMsg" ng-cloak="">{{reg.name}}</span>\n  </div>\n    <div class="wrapper">\n        <div id="error"></div>\n        <div ng-include="" src="\'/views/header.html\'"></div>\n        <section class="content">\n\n            <div class="container">\n\n                <div class="col-lg-3 col-md-4 col-sm-4" ng-controller="FilterCtrl" ng-include="" src="\'/views/filter.html\'"></div>\n\n                <div class="col-lg-6 col-md-8 col-sm-8 content-wrapper" ng-cloak="">\n                   <div class="leaders">\n                   <div class="title">Лидеры региона</div>\n                   <table class="leader-table">\n                      <tbody><tr>\n                        <td ng-repeat="reg in $root.firstRegions track by $index" ng-class="{hover : reg.id == $root.region}" ng-cloak=""><a href="" ng-click="$root.setRegion(reg.id)">{{reg.name}}</a></td>\n                      </tr>\n                      <tr>\n                        <td ng-repeat="reg in $root.lastRegions track by $index" ng-class="{hover : reg.id == $root.region}" ng-cloak=""><a href="" ng-click="$root.setRegion(reg.id)">{{reg.name}}</a></td>\n                      </tr>\n                    </tbody></table>\n                  </div>\n                  <div class="title" ng-show="$root.title" style="margin-top: -40px" ng-cloak="">{{$root.title}}</div>\n                    <p class="page-count" ng-show="$root.maxPages &gt; 1" ng-cloak="">{{$root.offset + 1}} из {{$root.maxPages}} стр.</p>\n                    <div ui-view="" class="uiview" autoscroll="false"></div>\n                    \n                    <div class="nav-bar">\n                      <button class="up" ng-show="$root.listFlag &amp;&amp; $root.offset &gt; 0" ng-click="$root.decOffset()" ng-cloak=""></button>\n                      <button class="up delete droppable" dropable="" drop="drop()" ng-show="$root.buttonFlag" ng-cloak=""></button>\n                      \n                      <div class="logo" ng-cloak="">\n                        <a ui-sref="leader">\n                            <img src="/img/kaska.png" alt="">\n                            <span>Главная</span>\n                          </a>\n                      </div>\n                      \n                      <button class="down" ng-show="$root.listFlag &amp;&amp; $root.offset + 2 &lt;= $root.maxPages" ng-click="$root.incOffset()" ng-cloak=""></button>\n                      <button class="back" go-back="" ng-cloak="">Назад</button>\n                      <button class="back pull-left" ng-show="$root.sortButton &amp;&amp; $root.jobOrderField == \'pub_date\'" ng-click="$root.sortBy(\'salary\')">Сортировать <br>по зарплате</button>\n                      <button class="back pull-left" ng-show="$root.sortButton &amp;&amp; $root.jobOrderField == \'salary\'" ng-click="$root.sortBy(\'pub_date\')">Сортировать <br>по дате</button>\n                    </div>\n                </div>\n                <div class="col-lg-3 col-md-3 right-block-service" id="info-bar" ng-class="{\'right-offset\': $root.adOffset == true}" ng-include="" src="\'/views/information.html\'" ng-show="$root.showAds == true || $root.adOffset == false"></div>\n            </div>\n        </section>\n        <!-- end content -->\n\n        <footer ng-controller="FooterCtrl" ng-include="" src="\'/views/footer.html\'"></footer>\n    </div>\n    <!-- end wrapper -->\n\n    <div class="notify">\n        <h1>\n            <div class="logoimg">\n                <img src="/img/logo-big.png" alt=""></div>\n            Разрешения устройства не достаточно для просмотра информации на этом сайте.\n        </h1>\n    </div>\n    <script> (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){ (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) })(window,document,\'script\',\'//www.google-analytics.com/analytics.js\',\'ga\'); ga(\'create\', \'UA-47375570-1\', \'kartatruda.ru\'); ga(\'send\', \'pageview\'); </script></body>',
        innerHTML: '<head>\n    <meta charset="utf-8">\n\n    <title ng-bind="$root.title"></title>\n\n    <!-- Данное значение часто используют поисковые системы, заполняем ответственно -->\n    <meta name="description" content="">\n    <!-- Адаптируем страницу для мобильных устройств -->\n    <meta name="viewport" content="width=1024, maximum-scale=2.0">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">\n    <meta name="description" content="Карта Труда - поиск вакансий рабочих специальностей.\nИнформационные терминалы по поиску работы в регионах.\nПоиск рабочих специальностей.">\n    <meta name="geo.region" content="RU">\n    <meta name="keywords" content="kartatruda.ru,картатруда.ру,карта,труд,рабочие,специальности,поиск,терминалы,информационные,вахта">\n    <meta name="geo.placename" content="Вешки">\n    <meta name="geo.position" content="55.928733;37.616887">\n    <meta name="ICBM" content="55.928733, 37.616887">\n\n    <!-- Традиционная иконка сайта, размер 16x16, прозрачность поддерживается. Рекомендуемый формат: .ico -->\n    <link rel="shortcut icon" href="/favicon.ico">\n\n    <!-- Иконка сайта для устройств от Apple, рекомендуемый размер 114x114, прозрачность не поддерживается -->\n    <link rel="apple-touch-icon" href="/apple-touch-icon.png">\n    <style media="screen" type="text/css">@import url(http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&subset=latin,cyrillic-ext);</style>\n    <link rel="stylesheet" type="text/css" href="/css/app.min.css">\n    <!--\n    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css" />\n    <link rel="stylesheet" type="text/css" href="/css/bootstrap-theme.css" />\n    <link rel="stylesheet" type="text/css" href="/css/style.css" />\n    <link rel="stylesheet" type="text/css" href="/css/custom.css" />\n    <link rel="stylesheet" type="text/css" href="/css/animation.css" />\n    <link rel="stylesheet" type="text/css" href="/bower_components/ngprogress-lite/ngprogress-lite.css" />\n    <link rel="stylesheet" type="text/css" href="/bower_components/leaflet-dist/leaflet.css" />\n    -->\n</head>\n\n<body>\n  <div class="region-popup hover" ng-show="$root.regionFlag" ng-cloak="">\n      <p ng-cloak="">{{$root.regionMsg}}</p>\n      <span ng-repeat="reg in $root.regions track by $index" class="region-item" ng-click="$root.setRegion(reg.id)" ng-show="$root.regionMsg" ng-cloak="">{{reg.name}}</span>\n  </div>\n    <div class="wrapper">\n        <div id="error"></div>\n        <div ng-include="" src="\'/views/header.html\'"></div>\n        <section class="content">\n\n            <div class="container">\n\n                <div class="col-lg-3 col-md-4 col-sm-4" ng-controller="FilterCtrl" ng-include="" src="\'/views/filter.html\'"></div>\n\n                <div class="col-lg-6 col-md-8 col-sm-8 content-wrapper" ng-cloak="">\n                   <div class="leaders">\n                   <div class="title">Лидеры региона</div>\n                   <table class="leader-table">\n                      <tbody><tr>\n                        <td ng-repeat="reg in $root.firstRegions track by $index" ng-class="{hover : reg.id == $root.region}" ng-cloak=""><a href="" ng-click="$root.setRegion(reg.id)">{{reg.name}}</a></td>\n                      </tr>\n                      <tr>\n                        <td ng-repeat="reg in $root.lastRegions track by $index" ng-class="{hover : reg.id == $root.region}" ng-cloak=""><a href="" ng-click="$root.setRegion(reg.id)">{{reg.name}}</a></td>\n                      </tr>\n                    </tbody></table>\n                  </div>\n                  <div class="title" ng-show="$root.title" style="margin-top: -40px" ng-cloak="">{{$root.title}}</div>\n                    <p class="page-count" ng-show="$root.maxPages &gt; 1" ng-cloak="">{{$root.offset + 1}} из {{$root.maxPages}} стр.</p>\n                    <div ui-view="" class="uiview" autoscroll="false"></div>\n                    \n                    <div class="nav-bar">\n                      <button class="up" ng-show="$root.listFlag &amp;&amp; $root.offset &gt; 0" ng-click="$root.decOffset()" ng-cloak=""></button>\n                      <button class="up delete droppable" dropable="" drop="drop()" ng-show="$root.buttonFlag" ng-cloak=""></button>\n                      \n                      <div class="logo" ng-cloak="">\n                        <a ui-sref="leader">\n                            <img src="/img/kaska.png" alt="">\n                            <span>Главная</span>\n                          </a>\n                      </div>\n                      \n                      <button class="down" ng-show="$root.listFlag &amp;&amp; $root.offset + 2 &lt;= $root.maxPages" ng-click="$root.incOffset()" ng-cloak=""></button>\n     