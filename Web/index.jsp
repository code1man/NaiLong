<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2024/10/22
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%--主页面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>奶龙舍</title>
    <link rel="stylesheet" type="text/css" href="index.css">
</head>
<body>
<div>
    <!-- topBar -->
    <div class="header">
        <div class="site-topBar">
            <div class="container">
                <div class="topBar-cart">
                    <a class="link">
                        <em class="iconfont-cart"></em>
                        <em class="iconfont-cart-full hide cart-minicart-mini"></em>购物车
                        <span class="cart-mini-num J_cartNum">（0）</span>
                    </a>
                </div>
                <div class="topBar-info">
                    <a href="" class="link">登录</a>
                    <span class="sep">|</span>
                    <a href="" data-register="true" class="link">注册</a>
                    <span class="sep">|</span>
                    <span class="message">
                    <a href="" class="J_needAgreement">消息通知
                <i class="J_miMessageTotal"></i>
              </a>
            </span>
                </div>
            </div>
        </div>
        <div class="site-header">
            <div class="container">
                <div class="header-logo"><a href="//www.mi.com" title="小米官网" class="logo ir">小米官网</a></div>
                <div class="header-nav">
                    <ul class="nav-list J_navMainList clearfix">
                        <li id="J_navCategory" class="nav-category"><a href="//www.mi.com/shop/category/list"
                                                                       class="link-category"><span
                                class="text">全部商品分类</span></a>
                            <div class="site-category" style="display: block;">
                                <ul id="J_categoryList" class="site-category-list clearfix site-category-list-custom">
                                    <li class="category-item">
                                        <a href="" class="title" data-settrack="true">
                                            手机
                                            <em class="iconfont-arrow-right-big"></em>
                                        </a>
                                        <div class="children clearfix children-col-2">
                                            <ul class="children-list children-list-col children-list-col-1">
                                                <li>
                                                    <a href="//www.mi.com/shop/search?keyword=xiaomimix%E7%B3%BB%E5%88%97"
                                                       class="link clearfix">
                                                        <img
                                                                src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/bb9e4a367f854221b60bb7b3b05e0173.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                                width="40" height="40" alt="" class="thumb"><span
                                                            class="text">Xiaomi MIX系列</span></a>
                                                </li>
                                                <li>
                                                    <a href="//www.mi.com/shop/search?keyword=xiaomi%E6%95%B0%E5%AD%97%E7%B3%BB%E5%88%97"
                                                       class="link clearfix">
                                                        <img
                                                                src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/4041dfcbaa3166d1c247f5dd2613a76b.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                                width="40" height="40" alt="" class="thumb"><span
                                                            class="text">Xiaomi 数字旗舰</span></a>
                                                </li>
                                                <li>
                                                    <a href="//www.mi.com/shop/search?keyword=xiaomicivi%E7%B3%BB%E5%88%97"
                                                       class="link clearfix"><img
                                                            src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/8baabd4fc4255a2cf81636335b4cf0c1.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                            width="40" height="40" alt="" class="thumb"><span
                                                            class="text">Xiaomi Civi系列</span></a>
                                                </li>
                                                <li><a href="//www.mi.com/shop/search?keyword=redmiK%E7%B3%BB%E5%88%97"
                                                       class="link clearfix"><img
                                                        src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/55b0ecc7cc8ab3714f311cc5df3bd0ae.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                        width="40" height="40" alt="" class="thumb"><span class="text">Redmi K系列</span></a>
                                                </li>
                                                <li>
                                                    <a href="//www.mi.com/shop/search?keyword=Redmi%20Turbo%E7%B3%BB%E5%88%97"
                                                       class="link clearfix">
                                                        <img
                                                                src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/e12d8f226458729f4c92063b09d4f0f2.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                                width="40" height="40" alt="" class="thumb"><span
                                                            class="text">Redmi Turbo系列</span></a>
                                                </li>
                                                <li>
                                                    <a href="//www.mi.com/shop/search?keyword=redminote%E7%B3%BB%E5%88%97"
                                                       class="link clearfix"><img
                                                            src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/a57303e8ac0d52a8b714a078cc35bfa1.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                            width="40" height="40" alt="" class="thumb"><span
                                                            class="text">Redmi Note系列</span></a>
                                                </li>
                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">
                                                <li>
                                                    <a href="//www.mi.com/shop/search?keyword=redmi%E6%95%B0%E5%AD%97%E7%B3%BB%E5%88%97"><img
                                                            src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/c15a3d1b4e8bf2af17e6b5ad5559cfcb.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                            width="40" height="40" alt="" class="thumb"><span
                                                            class="text">Redmi 数字系列</span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a data-spm="cms_10530.3476793.1" href="">
                                        电视
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-2">
                                            <ul class="children-list children-list-col children-list-col-1">
                                                <li><a href="https://www.mi.com/shop/buy?product_id=20549"
                                                       class="link clearfix">
                                                    <img
                                                            src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/9130e19fd3d14426e6f21b933a6415bf.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                            width="40" height="40" alt="" class="thumb"><span
                                                        class="text">小米电视 S Pro Mini
                                LED</span></a></li>
                                                <li><a href="https://www.mi.com/shop/buy?product_id=19759"><img
                                                        src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/fb29bd1fdc24747f29a1391842e7249b.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                        width="40" height="40" alt="" class="thumb"><span class="text">小米电视S Mini
                                LED系列</span></a>
                                                </li>
                                                <li><a href="https://www.mi.com/shop/buy?product_id=18487"><img
                                                        src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/c2e3fdbf6fe7a13c06644f16c8dc8877.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                        width="40" height="40" alt="" class="thumb"><span class="text">小米电视 S系列</span></a>
                                                </li>
                                                <li><a href="https://www.mi.com/shop/buy?product_id=2230002413">
                                                    <img
                                                            src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/51f0324fcbf7ba74cba9b3f052a2c383.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                            width="40" height="40" alt="" class="thumb"><span
                                                        class="text">Redmi 智能电视 A
                                Pro系列</span></a>
                                                </li>
                                                <li><a href="https://www.mi.com/shop/buy?product_id=18437"><img
                                                        src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/a4b477b5e44c1b9eb7d75c55f1c3f440.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                        width="40" height="40" alt="" class="thumb"><span class="text">小米电视A竞技系列</span></a>
                                                </li>
                                                <li><a href="https://www.mi.com/shop/buy?product_id=19879"><img
                                                        src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/932b72abec0b476c741a85669009add9.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                        width="40" height="40" alt="" class="thumb"><span class="text">Redmi电视 A系列
                                2025</span></a>
                                                </li>
                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">
                                                <li><a href="https://www.mi.com/shop/buy?product_id=20378"><img
                                                        src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/30508961963af8937ead2013b77b97fe.png?thumb=1&amp;w=50&amp;h=50&amp;f=webp&amp;q=90"
                                                        width="40" height="40" alt="" class="thumb"><span class="text">Redmi电视 MAX系列</span></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title">
                                        家电
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-4">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">
                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-3">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-4">

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item">
                                        <a data-spm="cms_10530.3476794.1" href="" class="title" data-settrack="true">
                                            笔记本 平板 显示器
                                            <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-2">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title">
                                        出行 穿戴
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-4">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-3">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-4">

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title">
                                        耳机 音箱
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-4">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-3">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-4">

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title">
                                        健康 儿童
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-3">
                                            <ul class="children-list children-list-col children-list-col-1">
                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">
                                                <ul class="children-list children-list-col children-list-col-3">
                                                </ul>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title">
                                        生活 箱包
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-3">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-3">

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title" data-settrack="true">
                                        智能 路由器
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-2">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">

                                            </ul>
                                        </div>
                                    </li>
                                    <li class="category-item"><a href="" class="title">
                                        电源 配件
                                        <em class="iconfont-arrow-right-big"></em></a>
                                        <div class="children clearfix children-col-2">
                                            <ul class="children-list children-list-col children-list-col-1">

                                            </ul>
                                            <ul class="children-list children-list-col children-list-col-2">

                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li data-index="4" class="nav-item"><a href="javascript: void(0);"
                                                               data-log_code="31pchomeother005000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.1"
                                                               data-spm="category_top_list.3916936.1" data-scm=""
                                                               class="link" data-settrack="true"
                                                               onclick="_msq.push(['trackEvent','31pchomeother005000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.1','','&quot;&quot;']);"><span
                                class="text">平板</span></a>
                            <div class="item-children">
                                <div class="container">
                                    <ul class="children-list clearfix">
                                        <li class="first"><a href="https://www.mi.com/shop/buy?product_id=19820"
                                                             target="_blank"
                                                             data-log_code="31pchomeother005001#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.2"
                                                             data-spm="category_top_list.3916936.2"
                                                             data-scm="server.0.0.0.product.19820.0.0"
                                                             data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=19820&quot;}"
                                                             data-settrack="true"
                                                             onclick="_msq.push(['trackEvent','31pchomeother005001#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.2','https://www.mi.com/shop/buy?product_id=19820','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/f8dd1013092765f219fb3f90a1076539.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Redmi Pad Pro" width="160" height="110"></div>
                                            <div class="title">Redmi Pad Pro</div>
                                            <p class="price">1399元起</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=19655" target="_blank"
                                               data-log_code="31pchomeother005002#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.3"
                                               data-spm="category_top_list.3916936.3"
                                               data-scm="server.0.0.0.product.19655.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=19655&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother005002#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.3','https://www.mi.com/shop/buy?product_id=19655','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/02afd89b3e5ca18b30e73b4ff7a31893.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi Pad 6S Pro 12.4" width="160" height="110"></div>
                                            <div class="title">Xiaomi Pad 6S Pro 12.4</div>
                                            <p class="price">2799元起</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=19166" target="_blank"
                                               data-log_code="31pchomeother005003#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.4"
                                               data-spm="category_top_list.3916936.4"
                                               data-scm="server.0.0.0.product.19166.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=19166&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother005003#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.4','https://www.mi.com/shop/buy?product_id=19166','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/75f234c4bc74c6a3cc6b054b24a5a94c.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Redmi Pad SE" width="160" height="110"></div>
                                            <div class="title">Redmi Pad SE</div>
                                            <p class="price">799元起</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=19013" target="_blank"
                                               data-log_code="31pchomeother005004#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.5"
                                               data-spm="category_top_list.3916936.5"
                                               data-scm="server.0.0.0.product.19013.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=19013&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother005004#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.5','https://www.mi.com/shop/buy?product_id=19013','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/dca0249868dc6938fda3f71baafe10db.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi Pad 6 Max 14" width="160" height="110"></div>
                                            <div class="title">Xiaomi Pad 6 Max 14</div>
                                            <p class="price">3499元起</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=18333" target="_blank"
                                               data-log_code="31pchomeother005005#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.6"
                                               data-spm="category_top_list.3916936.6"
                                               data-scm="server.0.0.0.product.18333.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=18333&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother005005#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.6','https://www.mi.com/shop/buy?product_id=18333','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/7097fe3a8afcc3b82cbbb6309e3090ce.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi Pad 6 Pro" width="160" height="110"></div>
                                            <div class="title">Xiaomi Pad 6 Pro</div>
                                            <p class="price">2149元起</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=18332" target="_blank"
                                               data-log_code="31pchomeother005006#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.7"
                                               data-spm="category_top_list.3916936.7"
                                               data-scm="server.0.0.0.product.18332.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=18332&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother005006#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3916936.7','https://www.mi.com/shop/buy?product_id=18332','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/a533fdb09c9e8d9e027ee7c1915ba815.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi Pad 6" width="160" height="110"></div>
                                            <div class="title">Xiaomi Pad 6</div>
                                            <p class="price">1899元起</p>
                                        </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li data-index="5" class="nav-item"><a href="javascript: void(0);"
                                                               data-log_code="31pchomeother006000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.1"
                                                               data-spm="category_top_list.3476896.1" data-scm=""
                                                               class="link" data-settrack="true"
                                                               onclick="_msq.push(['trackEvent','31pchomeother006000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.1','','&quot;&quot;']);"><span
                                class="text">家电</span></a>
                            <div class="item-children">
                                <div class="container">
                                    <ul class="children-list clearfix">
                                        <li class="first"><a href="https://www.mi.com/shop/buy?product_id=15948"
                                                             target="_blank"
                                                             data-log_code="31pchomeother006001#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.2"
                                                             data-spm="category_top_list.3476896.2"
                                                             data-scm="server.0.0.0.product.15948.0.0"
                                                             data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=15948&quot;}"
                                                             data-settrack="true"
                                                             onclick="_msq.push(['trackEvent','31pchomeother006001#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.2','https://www.mi.com/shop/buy?product_id=15948','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/531efbd4fd88b64a94079436851f56f1.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="米家冰箱对开门610L墨羽岩  " width="160" height="110"></div>
                                            <div class="title">米家冰箱对开门610L墨羽岩</div>
                                            <p class="price">1999元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=16197" target="_blank"
                                               data-log_code="31pchomeother006002#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.3"
                                               data-spm="category_top_list.3476896.3"
                                               data-scm="server.0.0.0.product.16197.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=16197&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother006002#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.3','https://www.mi.com/shop/buy?product_id=16197','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/52c8cab6760eadd9e01871dfbf27817f.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="米家冰箱 对开门536L 墨羽岩" width="160" height="110"></div>
                                            <div class="title">米家冰箱 对开门536L 墨羽岩</div>
                                            <p class="price">1999元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=15657" target="_blank"
                                               data-log_code="31pchomeother006003#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.4"
                                               data-spm="category_top_list.3476896.4"
                                               data-scm="server.0.0.0.product.15657.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=15657&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother006003#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.4','https://www.mi.com/shop/buy?product_id=15657','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/950767dbf6e63b853d39d413e97685a8.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="新风空调 立式3匹" width="160" height="110"></div>
                                            <div class="title">新风空调 立式3匹</div>
                                            <p class="price">5999元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=13143" target="_blank"
                                               data-log_code="31pchomeother006004#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.5"
                                               data-spm="category_top_list.3476896.5"
                                               data-scm="server.0.0.0.product.13143.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=13143&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother006004#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.5','https://www.mi.com/shop/buy?product_id=13143','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/80416c1c7040aabbafa527a6ea652948.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="小米空调 1.5匹新1级能效" width="160" height="110"></div>
                                            <div class="title">小米空调 1.5匹新1级能效</div>
                                            <p class="price">2499元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/machine-drive" target="_blank"
                                               data-log_code="31pchomeother006005#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.6"
                                               data-spm="category_top_list.3476896.6"
                                               data-scm="server.0.0.0.product.16636.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;overview&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fmachine-drive&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother006005#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.6','https://www.mi.com/machine-drive','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/85009f514f7505825899635daeb761b0.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="米家洗烘一体机 12kg" width="160" height="110"></div>
                                            <div class="title">米家洗烘一体机 12kg</div>
                                            <p class="price">1999元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=16585" target="_blank"
                                               data-log_code="31pchomeother006006#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.7"
                                               data-spm="category_top_list.3476896.7"
                                               data-scm="server.0.0.0.product.16585.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=16585&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother006006#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476896.7','https://www.mi.com/shop/buy?product_id=16585','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/3b6361cf5069af62f4208ee326bd0e43.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="米家冰柜 203L" width="160" height="110"></div>
                                            <div class="title">米家冰柜 203L</div>
                                            <p class="price">799元</p>
                                        </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li data-index="6" class="nav-item"><a href="javascript: void(0);"
                                                               data-log_code="31pchomeother007000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.1"
                                                               data-spm="category_top_list.3476897.1" data-scm=""
                                                               class="link" data-settrack="true"
                                                               onclick="_msq.push(['trackEvent','31pchomeother007000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.1','','&quot;&quot;']);"><span
                                class="text">路由器</span></a>
                            <div class="item-children">
                                <div class="container">
                                    <ul class="children-list clearfix">
                                        <li class="first"><a href="https://www.mi.com/xiaomi-ax3000t" target="_blank"
                                                             data-log_code="31pchomeother007001#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.2"
                                                             data-spm="category_top_list.3476897.2"
                                                             data-scm="server.0.0.0.product.19106.0.0"
                                                             data-params="{&quot;page_type&quot;:&quot;overview&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fxiaomi-ax3000t&quot;}"
                                                             data-settrack="true"
                                                             onclick="_msq.push(['trackEvent','31pchomeother007001#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.2','https://www.mi.com/xiaomi-ax3000t','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/b5de7ae24c438974939453553420f1a0.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi路由器AX3000T" width="160" height="110"></div>
                                            <div class="title">Xiaomi路由器AX3000T</div>
                                            <p class="price">159元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/xiaomi-routers/be-3600" target="_blank"
                                               data-log_code="31pchomeother007002#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.3"
                                               data-spm="category_top_list.3476897.3"
                                               data-scm="server.0.0.0.product.19647.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;overview&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fxiaomi-routers%252Fbe-3600&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother007002#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.3','https://www.mi.com/xiaomi-routers/be-3600','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/a8cc8ccb1c0e8cc58d96b7ec00df6634.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi路由器 BE3600" width="160" height="110"></div>
                                            <div class="title">Xiaomi路由器 BE3600</div>
                                            <p class="price">229元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/xiaomi-routers/6500pro" target="_blank"
                                               data-log_code="31pchomeother007003#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.4"
                                               data-spm="category_top_list.3476897.4"
                                               data-scm="server.0.0.0.product.19332.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;overview&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fxiaomi-routers%252F6500pro&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother007003#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.4','https://www.mi.com/xiaomi-routers/6500pro','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/2e4e053bd4dd41341ce8950ae1c3896d.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi路由器 BE6500 Pro" width="160" height="110"></div>
                                            <div class="title">Xiaomi路由器 BE6500 Pro</div>
                                            <p class="price">599元</p>
                                        </a></li>
                                        <li><a href="https://www.mi.com/xiaomi-routers/be-5000" target="_blank"
                                               data-log_code="31pchomeother007004#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.5"
                                               data-spm="category_top_list.3476897.5"
                                               data-scm="server.0.0.0.product.19990.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;overview&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fxiaomi-routers%252Fbe-5000&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother007004#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.5','https://www.mi.com/xiaomi-routers/be-5000','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj1.fds.api.mi-img.com/mi-mall/81f833a72b840274af1cf5931fb516f8.png?thumb=1&amp;w=200&amp;h=138&amp;f=webp&amp;q=90"
                                                    alt="Xiaomi路由器 BE5000" width="160" height="110"></div>
                                            <div class="title">Xiaomi路由器 BE5000</div>
                                            <p class="price">279元</p>
                                        </a></li>
                                        <li><a href="//www.mi.com/shop/search?keyword=%E8%B7%AF%E7%94%B1"
                                               target="_blank"
                                               data-log_code="31pchomeother007005#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.6"
                                               data-spm="category_top_list.3476897.6"
                                               data-scm="server.0.0.0.cms.search.0.0"
                                               data-params="{&quot;keyword&quot;:&quot;//www.mi.com/shop/search?keyword=%E8%B7%AF%E7%94%B1&quot;,&quot;uri&quot;:&quot;www.mi.com%252Fshop%252Fsearch%253Fkeyword=%252F%252Fwww.mi.com%252Fshop%252Fsearch%253Fkeyword=%2525E8%2525B7%2525AF%2525E7%252594%2525B1&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother007005#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.6','//www.mi.com/shop/search?keyword=%E8%B7%AF%E7%94%B1','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/2ddc6a2789c5f5ff78fa4ca1402417c8.png?thumb=1&amp;w=200&amp;h=138"
                                                    alt="查看全部#小米路由器" width="160" height="110"></div>
                                            <div class="title">查看全部<br>小米路由器</div>
                                        </a></li>
                                        <li><a href="https://www.mi.com/shop/buy?product_id=8645" target="_blank"
                                               data-log_code="31pchomeother007006#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.7"
                                               data-spm="category_top_list.3476897.7"
                                               data-scm="server.0.0.0.product.8645.0.0"
                                               data-params="{&quot;page_type&quot;:&quot;buy&quot;,&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=https:%252F%252Fwww.mi.com%252Fshop%252Fbuy%253Fproduct_id=8645&quot;}"
                                               data-settrack="true"
                                               onclick="_msq.push(['trackEvent','31pchomeother007006#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476897.7','https://www.mi.com/shop/buy?product_id=8645','&quot;&quot;']);">
                                            <div class="figure figure-thumb"><img
                                                    src="//cdn.cnbj0.fds.api.mi-img.com/b2c-mimall-media/28efac56ef4c4942077dac7e30e8c624.jpg?thumb=1&amp;w=200&amp;h=138"
                                                    alt="小米路由器 4C" width="160" height="110"></div>
                                            <div class="title">小米路由器 4C</div>
                                            <p class="price">79元</p>
                                        </a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li data-index="7" class="nav-item"><a href="https://www.mi.com/service/" target="_blank"
                                                               data-log_code="31pchomeother008000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476899.1"
                                                               data-spm="category_top_list.3476899.1"
                                                               data-scm="server.0.0.0.cms.url.0.0" class="link"
                                                               data-params="{&quot;uri&quot;:&quot;https:%252F%252Fwww.mi.com%252Fservice%252F&quot;}"
                                                               data-settrack="true"
                                                               onclick="_msq.push(['trackEvent','31pchomeother008000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476899.1','https://www.mi.com/service/','&quot;&quot;']);"><span
                                class="text">服务中心</span></a></li>
                        <li data-index="8" class="nav-item"><a href="http://www.xiaomi.cn/" target="_blank"
                                                               data-log_code="31pchomeother009000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476900.1"
                                                               data-spm="category_top_list.3476900.1"
                                                               data-scm="server.0.0.0.cms.url.0.0" class="link"
                                                               data-params="{&quot;uri&quot;:&quot;http:%252F%252Fwww.xiaomi.cn%252F&quot;}"
                                                               data-settrack="true"
                                                               onclick="_msq.push(['trackEvent','31pchomeother009000#t=normal&amp;act=other&amp;page=home&amp;page_id=10530&amp;bid=3476900.1','http://www.xiaomi.cn/','&quot;&quot;']);"><span
                                class="text">社区</span></a></li>
                    </ul>
                </div>
                <div class="header-search">
                    <form id="J_searchForm" action="//search.mi.com/search" method="get" class="search-form clearfix">
                        <label
                                for="search" class="hide">站内搜索</label> <a
                            data-log_code="bpm=28.265.3682762.1&amp;cdm=0.0.0.0"
                            class="no-style-msq" data-settrack="true"
                            onclick="_msq.push(['trackEvent','bpm=28.265.3682762.1&amp;cdm=0.0.0.0','','&quot;&quot;']);"><input
                            type="search" id="search" name="keyword" autocomplete="off"
                            data-search-config="{'defaultWords':[{&quot;word&quot;:&quot;Redmi K30&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468989.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;小米10&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468988.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;Redmi Note 8&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468986.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;小米CC9&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468985.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;黑鲨游戏手机&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468990.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;小米电视&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468984.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;小米笔记本&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468983.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;路由器&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468982.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;小爱音箱&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468981.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}},{&quot;word&quot;:&quot;净水器&quot;,&quot;block_id&quot;:0,&quot;action&quot;:{&quot;type&quot;:&quot;none&quot;,&quot;path&quot;:&quot;&quot;,&quot;log_code&quot;:&quot;31pcsearchother000000#t=normal\u0026act=other\u0026page=search\u0026bid=3468980.1&quot;,&quot;extra&quot;:&quot;&quot;,&quot;product_id&quot;:&quot;&quot;,&quot;goods_id&quot;:&quot;&quot;,&quot;default_line&quot;:&quot;&quot;,&quot;spm_stat&quot;:{&quot;spm_code&quot;:&quot;&quot;,&quot;spm_params&quot;:&quot;&quot;,&quot;scm&quot;:&quot;&quot;}}}]}"
                            class="search-text" placeholder="充电宝"></a> <a id="J_submitBtn"
                                                                             data-log_code="bpm=28.265.3682763.7&amp;cdm=0.1.0.searchWord-6a0151dcd0354c6d8e4f050915e2754d-充电宝-QUERY_HOT-QUERY-7-default&amp;next=28.265"
                                                                             class="no-style-msq" data-settrack="true"
                                                                             onclick="_msq.push(['trackEvent','bpm=28.265.3682763.1&amp;cdm=0.0.0.0&amp;next=28.265&amp;query=','','&quot;&quot;']);"><input
                            type="submit" value="" class="search-btn iconfont"></a>
                        <div class="search-hot-words"></div>
                        <div id="J_keywordList" class="keyword-list hide">
                            <ul class="result-list"></ul>
                        </div>
                    </form>
                </div>
                <div id="J_doodleWrapper"></div>
            </div>
        </div>
    </div>
    <!-- 轮转屏幕 -->
    <div class="home-hero-container container">
        <div class="home-hero">
            <div id="J_homeSwiper"
                 class="swiper-container home-hero-swiper swiper-no-swiping swiper-container-fade swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" style="transition-duration: 0ms;">
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-active"
                         data-swiper-slide-index="4"
                         style="width: 1226px; transition-duration: 0ms; opacity: 1; transform: translate3d(0px, 0px, 0px);">
                        <a
                                target="_blank" href="//www.mi.com/a/h/44376.html?sign=34f10dab7f2de557961e23e9d582a4c2"
                                data-spm="cms_10530.3480927.5" data-scm="cms.0.0.0.0.0.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=other&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.5&amp;adp=5192&amp;adm=38381"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=other&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.5&amp;adp=5192&amp;adm=38381','//www.mi.com/a/h/44376.html?sign=34f10dab7f2de557961e23e9d582a4c2','&quot;&quot;']);"><img
                                alt="" class="swiper-lazy swiper-lazy-loaded"
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/963cefaca23ab80758b6e0c2f6b99810.jpg?thumb=1&amp;w=1533&amp;h=575&amp;f=webp&amp;q=90"></a>
                    </div>
                    <div class="swiper-slide swiper-slide-duplicate-next" data-swiper-slide-index="0"
                         style="width: 1226px; transition-duration: 0ms; opacity: 1; transform: translate3d(-1226px, 0px, 0px);">
                        <a
                                target="_blank"
                                href="https://www.mi.com/a/h/44116.html?sign=be21b06fb5894d65173da20241230aea"
                                data-spm="cms_10530.3480927.1" data-scm="cms.0.0.0.0.0.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.1&amp;adp=5640&amp;adm=38384"
                                data-params="{&quot;component&quot;:&quot;home_slide&quot;,&quot;component_name&quot;:&quot;【广告】轮播 2452*920&quot;,&quot;img&quot;:975386}"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.1&amp;adp=5640&amp;adm=38384','https://www.mi.com/a/h/44116.html?sign=be21b06fb5894d65173da20241230aea','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/60384fcc4f60c1c16a503f08a594ae51.jpg?w=2452&amp;h=920"
                                alt="" class="swiper-lazy swiper-lazy-loaded"></a></div>
                    <div class="swiper-slide" data-swiper-slide-index="1"
                         style="width: 1226px; transition-duration: 0ms; opacity: 1; transform: translate3d(-2452px, 0px, 0px);">
                        <a
                                target="_blank"
                                href="https://www.mi.com/a/h/44116.html?sign=be21b06fb5894d65173da20241230aea"
                                data-spm="cms_10530.3480927.2" data-scm="cms.0.0.0.0.0.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.2&amp;adp=5146&amp;adm=38388"
                                data-params="{&quot;component&quot;:&quot;home_slide&quot;,&quot;component_name&quot;:&quot;【广告】轮播 2452*920&quot;,&quot;img&quot;:975425}"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.2&amp;adp=5146&amp;adm=38388','https://www.mi.com/a/h/44116.html?sign=be21b06fb5894d65173da20241230aea','&quot;&quot;']);"><img
                                alt="" class="swiper-lazy swiper-lazy-loaded"
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/899479250cef924e7a8e3bd63f838600.jpg?thumb=1&amp;w=1533&amp;h=575&amp;f=webp&amp;q=90"></a>
                    </div>
                    <div class="swiper-slide" data-swiper-slide-index="2"
                         style="width: 1226px; transition-duration: 0ms; opacity: 1; transform: translate3d(-3678px, 0px, 0px);">
                        <a
                                target="_blank" href="https://www.xiaomiev.com/" data-spm="cms_10530.3480927.3"
                                data-scm="cms.0.0.0.0.0.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.3&amp;adp=5807&amp;adm=37661"
                                data-params="{&quot;component&quot;:&quot;home_slide&quot;,&quot;component_name&quot;:&quot;【广告】轮播 2452*920&quot;,&quot;img&quot;:924390}"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.3&amp;adp=5807&amp;adm=37661','https://www.xiaomiev.com/','&quot;&quot;']);"><img
                                alt="" class="swiper-lazy swiper-lazy-loaded"
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/397f2569b126d8fba446b6bbf57ef771.jpg?thumb=1&amp;w=1533&amp;h=575&amp;f=webp&amp;q=90"></a>
                    </div>
                    <div class="swiper-slide swiper-slide-prev" data-swiper-slide-index="3"
                         style="width: 1226px; transition-duration: 0ms; opacity: 1; transform: translate3d(-4904px, 0px, 0px);">
                        <a
                                target="_blank" href="https://www.mi.com/shop/buy?product_id=20425"
                                data-spm="cms_10530.3480927.4"
                                data-scm="cms.0.0.0.product.20425.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=product&amp;page=homepage&amp;pid=20425&amp;page_id=10530&amp;bid=3480927.4&amp;adp=4025&amp;adm=38339"
                                data-params="{&quot;component&quot;:&quot;home_slide&quot;,&quot;component_name&quot;:&quot;【广告】轮播 2452*920&quot;,&quot;default_goods&quot;:&quot;20425&quot;,&quot;img&quot;:967633}"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=product&amp;page=homepage&amp;pid=20425&amp;page_id=10530&amp;bid=3480927.4&amp;adp=4025&amp;adm=38339','https://www.mi.com/shop/buy?product_id=20425','&quot;&quot;']);"><img
                                alt="" class="swiper-lazy swiper-lazy-loaded"
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/d58a9193326fea48a9a771075f8c70bc.png?thumb=1&amp;w=1533&amp;h=575&amp;f=webp&amp;q=90"></a>
                    </div>
                    <div class="swiper-slide swiper-slide-active" data-swiper-slide-index="4"
                         style="width: 1226px; transition-duration: 0ms; opacity: 1; transform: translate3d(-6130px, 0px, 0px);">
                        <a
                                target="_blank" href="//www.mi.com/a/h/44376.html?sign=34f10dab7f2de557961e23e9d582a4c2"
                                data-spm="cms_10530.3480927.5" data-scm="cms.0.0.0.0.0.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=other&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.5&amp;adp=5192&amp;adm=38381"
                                data-params="{&quot;component&quot;:&quot;home_slide&quot;,&quot;component_name&quot;:&quot;【广告】轮播 2452*920&quot;,&quot;img&quot;:974908}"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=other&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.5&amp;adp=5192&amp;adm=38381','//www.mi.com/a/h/44376.html?sign=34f10dab7f2de557961e23e9d582a4c2','&quot;&quot;']);"><img
                                alt="" class="swiper-lazy swiper-lazy-loaded"
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/963cefaca23ab80758b6e0c2f6b99810.jpg?thumb=1&amp;w=1533&amp;h=575&amp;f=webp&amp;q=90"></a>
                    </div>
                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-next" data-swiper-slide-index="0"
                         style="width: 1226px; transition-duration: 0ms; opacity: 0; transform: translate3d(-7356px, 0px, 0px);">
                        <a
                                target="_blank"
                                href="https://www.mi.com/a/h/44116.html?sign=be21b06fb5894d65173da20241230aea"
                                data-spm="cms_10530.3480927.1" data-scm="cms.0.0.0.0.0.0.0"
                                data-log_code="31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.1&amp;adp=5640&amp;adm=38384"
                                data-settrack="true"
                                onclick="_msq.push(['trackEvent','31pchomepagegallery000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480927.1&amp;adp=5640&amp;adm=38384','https://www.mi.com/a/h/44116.html?sign=be21b06fb5894d65173da20241230aea','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/60384fcc4f60c1c16a503f08a594ae51.jpg?w=2452&amp;h=920"
                                alt="" class="swiper-lazy swiper-lazy-loaded"></a></div>
                </div>
                <div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><a
                        class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 1"></a><a
                        class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></a><a
                        class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></a><a
                        class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></a><a
                        class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button"
                        aria-label="Go to slide 5"></a></div>
                <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide"></div>
                <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide"></div>
                <span
                        class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
            </div>
            <div class="home-hero-sub row">
                <div class="span4">
                    <ul class="home-channel-list clearfix">
                        <li><a target="_blank"
                               href="https://api.jr.mi.com/activity/scene/scenePCsearch.html?from=search"
                               data-spm="cms_10530.3480970.1" data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagefeatures_entrance001001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.1"
                               data-params="{&quot;component&quot;:&quot;six_icon&quot;,&quot;component_name&quot;:&quot;【功能】功能入口&quot;,&quot;img&quot;:203877}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagefeatures_entrance001001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.1','https://api.jr.mi.com/activity/scene/scenePCsearch.html?from=search','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/82abdba456e8caaea5848a0cddce03db.png?w=48&amp;h=48"
                                alt="保障服务">
                            保障服务
                        </a></li>
                        <li><a target="_blank" href="https://business.qiye.mi.com" data-spm="cms_10530.3480970.2"
                               data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagefeatures_entrance002001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.2"
                               data-params="{&quot;component&quot;:&quot;six_icon&quot;,&quot;component_name&quot;:&quot;【功能】功能入口&quot;,&quot;img&quot;:199065}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagefeatures_entrance002001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.2','https://business.qiye.mi.com','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/806f2dfb2d27978e33fe3815d3851fa3.png?w=48&amp;h=48"
                                alt="企业团购">
                            企业团购
                        </a></li>
                        <li><a target="_blank" href="https://www.mi.com/order/fcode" data-spm="cms_10530.3480970.3"
                               data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagefeatures_entrance003001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.3"
                               data-params="{&quot;component&quot;:&quot;six_icon&quot;,&quot;component_name&quot;:&quot;【功能】功能入口&quot;,&quot;img&quot;:199067}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagefeatures_entrance003001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.3','https://www.mi.com/order/fcode','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/eded6fa3b897a058163e2485532c4f10.png?w=48&amp;h=48"
                                alt="F码通道">
                            F码通道
                        </a></li>
                        <li><a target="_blank" href="https://10046.mi.com" data-spm="cms_10530.3480970.4"
                               data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagefeatures_entrance004001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.4"
                               data-params="{&quot;component&quot;:&quot;six_icon&quot;,&quot;component_name&quot;:&quot;【功能】功能入口&quot;,&quot;img&quot;:199068}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagefeatures_entrance004001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.4','https://10046.mi.com','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/43a3195efa6a3cc7662efed8e7abe8bf.png?w=48&amp;h=48"
                                alt="米粉卡">
                            米粉卡
                        </a></li>
                        <li><a target="_blank" href="//www.mi.com/a/h/16769.html" data-spm="cms_10530.3480970.5"
                               data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagefeatures_entrance005001#t=normal&amp;act=other&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.5"
                               data-params="{&quot;component&quot;:&quot;six_icon&quot;,&quot;component_name&quot;:&quot;【功能】功能入口&quot;,&quot;img&quot;:199069}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagefeatures_entrance005001#t=normal&amp;act=other&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.5','//www.mi.com/a/h/16769.html','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/f4846bca6010a0deb9f85464409862af.png?w=48&amp;h=48"
                                alt="以旧换新">
                            以旧换新
                        </a></li>
                        <li><a target="_blank" href="https://recharge.10046.mi.com/" data-spm="cms_10530.3480970.6"
                               data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagefeatures_entrance006001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.6"
                               data-params="{&quot;component&quot;:&quot;six_icon&quot;,&quot;component_name&quot;:&quot;【功能】功能入口&quot;,&quot;img&quot;:199070}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagefeatures_entrance006001#t=normal&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480970.6','https://recharge.10046.mi.com/','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/9a76d7636b08e0988efb4fc384ae497b.png?w=48&amp;h=48"
                                alt="话费充值">
                            话费充值
                        </a></li>
                    </ul>
                </div>
                <div class="span16">
                    <ul id="J_homePromoList" class="home-promo-list clearfix">
                        <li class="first"><a target="_blank" href="https://www.mi.com/shop/buy?product_id=19300"
                                             data-spm="cms_10530.3480925.1" data-scm="cms.0.0.0.product.19300.0.0"
                                             data-log_code="31pchomepagecells_auto_fill000001#t=ad&amp;act=product&amp;page=homepage&amp;pid=19300&amp;page_id=10530&amp;bid=3480925.1&amp;adp=3119&amp;adm=36561"
                                             data-params="{&quot;component&quot;:&quot;three_line&quot;,&quot;component_name&quot;:&quot;【广告】三拼&quot;,&quot;default_goods&quot;:&quot;19300&quot;,&quot;img&quot;:876191}"
                                             data-settrack="true"
                                             onclick="_msq.push(['trackEvent','31pchomepagecells_auto_fill000001#t=ad&amp;act=product&amp;page=homepage&amp;pid=19300&amp;page_id=10530&amp;bid=3480925.1&amp;adp=3119&amp;adm=36561','https://www.mi.com/shop/buy?product_id=19300','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/6b67117bc92924fb2ff0e7ad2be86084.png?w=632&amp;h=340"
                                alt=""></a></li>
                        <li><a target="_blank" href="https://www.mi.com/shop/buy?product_id=10050036"
                               data-spm="cms_10530.3480925.2"
                               data-scm="cms.0.0.0.product.10050036.0.0"
                               data-log_code="31pchomepagecells_auto_fill000001#t=ad&amp;act=product&amp;page=homepage&amp;pid=10050036&amp;page_id=10530&amp;bid=3480925.2&amp;adp=3118&amp;adm=36209"
                               data-params="{&quot;component&quot;:&quot;three_line&quot;,&quot;component_name&quot;:&quot;【广告】三拼&quot;,&quot;default_goods&quot;:&quot;10050036&quot;,&quot;img&quot;:853057}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagecells_auto_fill000001#t=ad&amp;act=product&amp;page=homepage&amp;pid=10050036&amp;page_id=10530&amp;bid=3480925.2&amp;adp=3118&amp;adm=36209','https://www.mi.com/shop/buy?product_id=10050036','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/8dede2520f8dfff9c9b690af498cafe8.jpg?w=632&amp;h=340"
                                alt=""></a></li>
                        <li><a target="_blank" href="https://www.mi.com/xiaomibuds4pro" data-spm="cms_10530.3480925.3"
                               data-scm="cms.0.0.0.0.0.0.0"
                               data-log_code="31pchomepagecells_auto_fill000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480925.3&amp;adp=3117&amp;adm=36211"
                               data-params="{&quot;component&quot;:&quot;three_line&quot;,&quot;component_name&quot;:&quot;【广告】三拼&quot;,&quot;img&quot;:853845}"
                               data-settrack="true"
                               onclick="_msq.push(['trackEvent','31pchomepagecells_auto_fill000001#t=ad&amp;act=webview&amp;page=homepage&amp;page_id=10530&amp;bid=3480925.3&amp;adp=3117&amp;adm=36211','https://www.mi.com/xiaomibuds4pro','&quot;&quot;']);"><img
                                src="https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/1ac77590368ff636d0b4f6a988133f55.png?w=632&amp;h=340"
                                alt=""></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
