/*
 * artDialog iframeTools
 * Date: 2011-08-29 17:25
 * http://code.google.com/p/artdialog/
 * (c) 2009-2011 TangBin, http://www.planeArt.cn
 *
 * This is licensed under the GNU LGPL, version 2.1 or later.
 * For details, see: http://creativecommons.org/licenses/LGPL/2.1/
 */
/*****************add by Perhaps***********************/
/***
 * test json
 */
var json ={
    desktopid : "desk01",
    listitem :[
        {
            url:"http://www.baidu.com/",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"http://www.taobao.com/",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        },
        {
            url:"javascript:void(0);",
            icon:"images/XX.png",
            text:"办件列表"
        }
    ]
};
/***
 *  add list to dialog
 *
 */
var LIST = (function(){
    var thisTab=window.location.hash && window.location.hash.substring(1) || 0;
    var w,h;
    /**
     * @constructor Animate
     * @param {HTMLElement} el the element we want to animate
     * @param {String} prop the CSS property we will be animating
     * @param {Object} opts a configuration object
     * object properties include
     * from {Int}
     * to {Int}
     * time {Int} time in milliseconds
     * callback {Function}
     */
    function Animate(el, prop, opts) {
        this.el = el;
        this.prop = prop;
        this.from = opts.from;
        this.to = opts.to;
        this.time = opts.time;
        this.callback = opts.callback;
        this.animDiff = this.to - this.from;
    }

    /**
     * @private
     * @param {String} val the CSS value we will set on the property
     */
    Animate.prototype._setStyle = function(val) {
        switch (this.prop) {
            case 'opacity':
                this.el.style[this.prop] = val;
                this.el.style.filter = 'alpha(opacity=' + val * 100 + ')';
                break;

            default:
                this.el.style[this.prop] = val + 'px';
                break;
        };
    };

    /**
     * @private
     * this is the tweening function
     */
    Animate.prototype._animate = function() {
        var that = this;
        this.now = new Date();
        this.diff = this.now - this.startTime;

        if (this.diff > this.time) {
            this._setStyle(this.to);

            if (this.callback) {
                this.callback.call(this);
            }
            clearInterval(this.timer);
            return;
        }

        this.percentage = (Math.floor((this.diff / this.time) * 100) / 100);
        this.val = (this.animDiff * this.percentage) + this.from;
        this._setStyle(this.val);
    };

    /**
     * @public
     * begins the animation
     */
    Animate.prototype.start = function() {
        var that = this;
        this.startTime = new Date();

        this.timer = setInterval(function() {
            that._animate.call(that);
        }, 4);
    };


    /**
     * @static
     * @boolean
     * allows us to check if native CSS transitions are possible
     */
    Animate.canTransition = function() {
        var el = document.createElement('twitter');
        el.style.cssText = '-webkit-transition: all .5s linear;';
        return !!el.style.webkitTransitionProperty;
    }();
    function List(){
        //this.insertList = true;
    }
    List.prototype.init = function(list,ele){
        this.initWrap(ele);
        this.appendItem(list,ele);
        this.detectWidth(ele);
    };
    List.prototype.initWrap = function(ele){
        var str = '<div class="ps_listwrap"><div class="ps_slide"><ul class="clearfix"></ul></div></div>';
        this.rawE = ele;
        this.ele = ele ? $(ele.content()) : $("body");
        this.ele.prepend(str);
        this.wrap = $(".ps_listwrap");
        w = this.ele.width();
        h = this.ele.height();
        this.wrap.width(w);

        this.ul = $(".ps_listwrap ul");
    }
    List.prototype.appendItem = function(arr,ele){
        var str='';
        var li_width=0;
        for(var i=0;i<arr.length;i++){
            if(i==thisTab){
                str = '<li>'
                    +'<a href="'+arr[i].url+'" class="ps_current" target="'+ele.iframe.name+'">'
                    +'<img src="'+arr[i].icon+'" alt="" />'
                    +'<span>'+arr[i].text+'</span>'
                    +'</a>'
                    +'</li>';
            }else{
                str = '<li>'
                    +'<a href="'+arr[i].url+'" target="'+ele.iframe.name+'">'
                    +'<img src="'+arr[i].icon+'" alt="" />'
                    +'<span>'+arr[i].text+'</span>'
                    +'</a>'
                    +'</li>';
            }
            this.ul.append(str);
        }
        this.lis = this.ul.children();
        li_width = this.lis.width()+ parseInt(isNaN(this.lis.css("border-left-width"))?0:this.lis.css("border-left-width"),10)+parseInt(isNaN(this.lis.css("border-right-width"))?0:this.lis.css("border-right-width"),10);
        this.ul.width(li_width*arr.length);
    };
    List.prototype.appendArrow = function(){
        var leftA = '<a href="javascript:void(0);" class="ps_left_arrow ps_arrow"></a>';
        var rightA = '<a href="javascript:void(0);" class="ps_right_arrow ps_arrow"></a>';
        this.wrap.append(leftA);
        this.wrap.append(rightA);
        this.adjustSlide();
        this.bindEvent();
    };
    List.prototype.removeArrow = function(){
        $(".ps_arrow").remove();
    };
    //如果出现箭头，需要调整列表宽度，以免被箭头遮住
    List.prototype.adjustSlide = function(){
        var wrap_width =this.wrap.width();
        var arrow_width = $(".ps_arrow").width();
        $(".ps_slide").width(wrap_width - arrow_width*2);
    };
    //检测宽度，如果列表宽度大于外层宽度，放出箭头
    List.prototype.detectWidth = function(){
        var ul_width = this.ul.width();
        var wrap_width = this.wrap.width();
        if(ul_width>wrap_width){
            this.appendArrow();
        }
    };
    List.prototype.bindEvent = function(){
        var root = this;
        $(".ps_arrow").on("click",function(){
            if(root.ul.is(":animated")) return;
            var ul_ml = parseInt(root.ul.css("margin-left"));
            var li_width = root.lis.width()+ parseInt(isNaN(root.lis.css("border-left-width"))?0:root.lis.css("border-left-width"),10)+parseInt(isNaN(root.lis.css("border-right-width"))?0:root.lis.css("border-right-width"),10);
            var ul_width = root.ul.width();
            var slide_width = $(".ps_slide").width();
            var target_ml;
            if($(this).hasClass("ps_left_arrow")){
                target_ml = ul_ml - li_width;
                if(Math.abs(target_ml) > (ul_width - slide_width)){
                    target_ml = -(ul_width - slide_width);
                }
                new Animate(root.ul.get(0),"marginLeft",{
                    from:ul_ml,
                    to:target_ml,
                    time:500,
                    callback:function(){
                }
                }).start();
//                root.ul.animate({
//                    "margin-left":target_ml+"px"
//                },
//                    500,
//                    "swing",
//                    function(){
//
//                    });

            }else if($(this).hasClass("ps_right_arrow")){
                target_ml = ul_ml + li_width;
                if(target_ml > 0){
                    target_ml = 0;
                }
                new Animate(root.ul.get(0),"marginLeft",{
                    from:ul_ml,
                    to:target_ml,
                    time:500,
                    callback:function(){
                    }
                }).start();
//                root.ul.animate({
//                    "margin-left":target_ml + "px"
//                },
//                   500,
//                   "swing",
//                    function(){
//
//                    }
//                );
            }
        });
        this.lis.find("a").click(function(e){
            var e = e || window.event;
            e.stopPropagation();
            root.w = $(root.rawE.iframe).width();
            root.h = $(root.rawE.iframe).height();
            root.rawE.iframe.src =  $(this).attr("href");
            return false;
        });

    };
    List.prototype.reset = function(target){
        if(!this.wrap) return;
      this.removeArrow();
        if(target){
            this.wrap.css({
                width:w + "px"
            });
        }else{
            this.wrap.css({
                width:"100%"
            });
        }
        $(".ps_slide").css({
            width:this.wrap.width()+"px"
        });
        this.detectWidth();
    };
    return new List();
}());
/*************************end**************************/
(function (g, k, a, f) {
    var l, i, d, b = "@ARTDIALOG.DATA", c = "@ARTDIALOG.OPEN", e = "@ARTDIALOG.OPENER", h = k.name = k.name || "@ARTDIALOG.WINNAME" + (new Date).getTime(), j = k.VBArray && !k.XMLHttpRequest;
    g(function () {
        !k.jQuery && document.compatMode === "BackCompat" && alert('artDialog Error: document.compatMode === "BackCompat"')
    });
    var m = a.top = function () {
        var n = k, o = function (p) {
            try {
                var r = k[p].document;
                r.getElementsByTagName
            } catch (q) {
                return false
            }
            return k[p].artDialog && r.getElementsByTagName("frameset").length === 0
        };
        if (o("top")) {
            n = k.top
        } else {
            if (o("parent")) {
                n = k.parent
            }
        }
        return n
    }();
    a.parent = m;
    l = m.artDialog;
    d = function () {
        return l.defaults.zIndex
    };
    a.data = function (o, p) {
        var q = a.top, n = q[b] || {};
        q[b] = n;
        if (p) {
            n[o] = p
        } else {
            return n[o]
        }
        return n
    };
    a.removeData = function (o) {
        var n = a.top[b];
        if (n && n[o]) {
            delete n[o]
        }
    };
    a.through = i = function () {
        var n = l.apply(this, arguments);
        if (m !== k) {
            a.list[n.config.id] = n
        }
        return n
    };
    m !== k && g(k).bind("unload", function () {
        var p = a.list, n;
        for (var o in p) {
            if (p[o]) {
                n = p[o].config;
                if (n) {
                    n.duration = 0
                }
                p[o].close();
                delete p[o]
            }
        }
    });
    a.open = function (r, p, y) {
        p = p || {};
        var x, D, q, v, u, w, C, E, s, z = a.top, o = "position:absolute;left:-9999em;top:-9999em;border:none 0;background:transparent", A = "width:100%;height:100%;border:none 0";//100%
        if (y === false) {
            var n = (new Date()).getTime(), G = r.replace(/([?&])_=[^&]*/, "$1_=" + n);
            r = G + ((G === r) ? (/\?/.test(r) ? "&" : "?") + "_=" + n : "")
        }
        var t = function () {
            var I, K, L = D.content.find(".aui_loading"), H = x.config;
            q.addClass("aui_state_full");
            L && L.hide();
            try {
                E = u.contentWindow;
                C = g(E.document);
                s = E.document.body
            } catch (J) {
                u.style.cssText = A;
                //修正height  PS
                u.style.height = H.c_height -5+"px";
                /****M by Perhaps ****/
                //H.follow ? x.follow(H.follow) : x.position(H.left, H.top);
                /*****end*************/
                p.init && p.init.call(x, E, z);
                p.init = null;
                return
            }
            I = H.width === "auto" ? C.width() + (j ? 0 : parseInt(g(s).css("marginLeft"))) : H.width;
            K = H.height === "auto" ? C.height() : H.height;
            setTimeout(function () {
                u.style.cssText = A;
                //修正height  PS
                u.style.height = H.c_height -5+"px";
            }, 0);
            x.size(I, K);
            H.follow ? x.follow(H.follow) : x.position(H.left, H.top);
            p.init && p.init.call(x, E, z);
            p.init = null
        };
        var F = {zIndex: d(), init: function () {
            x = this;
            D = x.DOM;
            v = D.main;
            q = D.content;
            u = x.iframe = z.document.createElement("iframe");
            u.src = r;
            u.name = "Open" + x.config.id;
            u.style.cssText = o;
            u.setAttribute("frameborder", 0, 0);
            u.setAttribute("allowTransparency", true);
            w = g(u);
            /****add by perhaps***/
            if(p.insertList)
            LIST.init(json.listitem, x);
            /*************end*******/
            x.content().appendChild(u);
            E = u.contentWindow;
            try {
                E.name = u.name;
                a.data(u.name + c, x);
                a.data(u.name + e, k)
            } catch (H) {
            }
            w.bind("load", t)
        }, close: function () {
            w.css("display", "none").unbind("load", t);
            if (p.close && p.close.call(this, u.contentWindow, z) === false) {
                return false
            }
            q.removeClass("aui_state_full");
            w[0].src = "about:blank";
            w.remove();
            try {
                a.removeData(u.name + c);
                a.removeData(u.name + e)
            } catch (H) {
            }
        }};
        if (typeof p.ok === "function") {
            F.ok = function () {
                return p.ok.call(x, u.contentWindow, z)
            }
        }
        if (typeof p.cancel === "function") {
            F.cancel = function () {
                return p.cancel.call(x, u.contentWindow, z)
            }
        }
        delete p.content;
        for (var B in p) {
            if (F[B] === f) {
                F[B] = p[B]
            }
        }
        return i(F)
    };
    a.open.api = a.data(h + c);
    a.opener = a.data(h + e) || k;
    a.open.origin = a.opener;
    a.close = function () {
        var n = a.data(h + c);
        n && n.close();
        return false
    };
    a.max = function () {
        var n = a.data(h + c);
        n && n._maxWin();
        return false
    };
    a.min = function () {
        var n = a.data(h + c);
        n && n._minWin();
        return false
    };
    m != k && g(document).bind("mousedown", function () {
        var n = a.open.api;
        n && n.focus(true)
    });
    a.load = function (q, p, n) {
        n = n || false;
        var s = p || {};
        var o = {zIndex: d(), init: function (u) {
            var v = this, t = v.config;
            g.ajax({url: q, success: function (w) {
                v.content(w);
                s.init && s.init.call(v, u)
            }, cache: n})
        }};
        delete p.content;
        for (var r in s) {
            if (o[r] === f) {
                o[r] = s[r]
            }
        }
        return i(o)
    };
    a.alert = function (n) {
        return i({id: "Alert", zIndex: d(), icon: "warning", fixed: true, lock: true, max: false, min: false, content: n, ok: true})
    };
    a.success = function (n) {
        return i({id: "success", zIndex: d(), icon: "succeed", fixed: true, lock: true, max: false, min: false, content: n, ok: true, init: function () {
            var q = this, o = 3;
            var p = function () {
                q.title(o + "\u7ec9\u6391\u6097\u934f\u62bd\u68f4");
                !o && q.close();
                o--
            };
            timer = setInterval(p, 1000);
            p()
        }, close: function () {
            clearInterval(timer)
        }})
    };
    a.error = function (n) {
        return i({id: "error", zIndex: d(), icon: "error", fixed: true, lock: true, max: false, min: false, content: n, ok: true, init: function () {
            var q = this, o = 3;
            var p = function () {
                q.title(o + "\u7ec9\u6391\u6097\u934f\u62bd\u68f4");
                !o && q.close();
                o--
            };
            timer = setInterval(p, 1000);
            p()
        }, close: function () {
            clearInterval(timer)
        }})
    };
    a.confirm = function (n, p, o) {
        return i({id: "Confirm", zIndex: d(), icon: "question", fixed: true, lock: true, max: false, min: false, opacity: 0.1, content: n, ok: function (q) {
            return p.call(this, q)
        }, cancel: function (q) {
            return o && o.call(this, q)
        }})
    };
    a.confirmSuccess = function (n, p, o) {
        return i({id: "ConfirmSuccess", zIndex: d(), icon: "warning", fixed: false, lock: false, max: false, min: false, opacity: 0.1, content: n, ok: function (q) {
            return p.call(this, q)
        }})
    };
    a.prompt = function (o, q, p) {
        p = p || "";
        var n;
        return i({id: "Prompt", zIndex: d(), icon: "question", fixed: true, lock: true, max: false, min: false, opacity: 0.1, content: ['<div style="margin-bottom:5px;font-size:12px">', o, "</div>", "<div>", '<input value="', p, '" style="width:18em;padding:6px 4px" />', "</div>"].join(""), init: function () {
            n = this.DOM.content.find("input")[0];
            n.select();
            n.focus()
        }, ok: function (r) {
            return q && q.call(this, n.value, r)
        }, cancel: true})
    };
    a.tips = function (n, o) {
        return i({id: "Tips", zIndex: d(), title: false, cancel: false, fixed: true, lock: false}).content('<div style="padding: 0 1em;">' + n + "</div>").time(o || 1.5)
    };
    g(function () {
        var p = a.dragEvent;
        if (!p) {
            return
        }
        var s = g(k), r = g(document), t = j ? "absolute" : "fixed", q = p.prototype, n = document.createElement("div"), o = n.style;
        o.cssText = "display:none;position:" + t + ";left:0;top:0;width:100%;height:100%;cursor:move;filter:alpha(opacity=0);opacity:0;background:#FFF";
        document.body.appendChild(n);
        q._start = q.start;
        q._end = q.end;
        q.start = function () {
            var w = a.focus.DOM, u = w.main[0], v = w.content[0].getElementsByTagName("iframe")[0];
            q._start.apply(this, arguments);
            o.display = "block";
            o.zIndex = a.defaults.zIndex + 3;
            if (t === "absolute") {
                o.width = s.width() + "px";
                o.height = s.height() + "px";
                o.left = r.scrollLeft() + "px";
                o.top = r.scrollTop() + "px"
            }
        };
        q.end = function () {
            var u = a.focus;
            q._end.apply(this, arguments);
            o.display = "none";
            if (u) {
                u.DOM.main[0].style.visibility = "visible"
            }
        }
    })
})(window.jQuery || window.art, this, this.artDialog);
