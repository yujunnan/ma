(window["webpackJsonp"] = window["webpackJsonp"] || []).push([[9],{

/***/ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=script&lang=js&":
/*!**********************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib??ref--4-0!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/web/home/barrage.vue?vue&type=script&lang=js& ***!
  \**********************************************************************************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var vue_baberrage__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vue-baberrage */ "./node_modules/vue-baberrage/dist/vue-baberrage.js");
/* harmony import */ var vue_baberrage__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(vue_baberrage__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _common_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ../../../common.js */ "./resources/js/common.js");
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
 // 引入公共的common，来做为中间传达的工具


/* harmony default export */ __webpack_exports__["default"] = ({
  name: 'danmu',
  data: function data() {
    return {
      msg: '你好，学院君！',
      position: 'abc',
      barrageIsShow: true,
      currentId: 0,
      barrageLoop: false,
      barrageList: []
    };
  },
  mounted: function mounted() {
    var _this = this;

    var vm = this; // 用$on事件来接收参数

    _common_js__WEBPACK_IMPORTED_MODULE_1__["default"].$on('message', function (data) {
      _this.addToList(data.position, data.message);
    });
  },
  methods: {
    removeList: function removeList() {
      this.barrageList = [];
    },
    addToList: function addToList(position, message) {
      if (this.position === 'top') {
        this.barrageList.push({
          id: ++this.currentId,
          avatar: 'https://xueyuanjun.com/assets/avatars/numxwdxf8lrtrsol.jpg',
          msg: message,
          barrageStyle: 'top',
          time: 8,
          type: vue_baberrage__WEBPACK_IMPORTED_MODULE_0__["MESSAGE_TYPE"].FROM_TOP,
          position: 'top'
        });
      } else {
        this.barrageList.push({
          id: ++this.currentId,
          avatar: 'https://xueyuanjun.com/assets/avatars/numxwdxf8lrtrsol.jpg',
          msg: message,
          time: 15,
          type: vue_baberrage__WEBPACK_IMPORTED_MODULE_0__["MESSAGE_TYPE"].NORMAL
        });
      }
    },
    sendMsg: function sendMsg() {
      _common_js__WEBPACK_IMPORTED_MODULE_1__["default"].$emit('msg', '{"position":"' + this.position + '", "message":"' + this.msg + '"}');
    }
  }
});

/***/ }),

/***/ "./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true&":
/*!*********************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/css-loader!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--7-2!./node_modules/sass-loader/dist/cjs.js??ref--7-3!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true& ***!
  \*********************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

exports = module.exports = __webpack_require__(/*! ../../../../../node_modules/css-loader/lib/css-base.js */ "./node_modules/css-loader/lib/css-base.js")(false);
// imports


// module
exports.push([module.i, "#danmu[data-v-c40519ec] {\n  font-family: \"Avenir\", Helvetica, Arial, sans-serif;\n  -webkit-font-smoothing: antialiased;\n  -moz-osx-font-smoothing: grayscale;\n  text-align: center;\n  color: #2c3e50;\n}\n.stage[data-v-c40519ec] {\n  height: 300px;\n  width: 100%;\n  margin: 0;\n  position: relative;\n  overflow: hidden;\n}\nh1[data-v-c40519ec], h2[data-v-c40519ec] {\n  font-weight: normal;\n}\nul[data-v-c40519ec] {\n  list-style-type: none;\n  padding: 0;\n}\nli[data-v-c40519ec] {\n  display: inline-block;\n  margin: 0 10px;\n}\na[data-v-c40519ec] {\n  color: #42b983;\n}\n.baberrage-stage[data-v-c40519ec] {\n  z-index: 5;\n}\n.baberrage-stage .baberrage-item.normal[data-v-c40519ec] {\n  color: #FFF;\n}\n.top[data-v-c40519ec] {\n  border: 1px solid #66aabb;\n}\n.danmu-control[data-v-c40519ec] {\n  position: absolute;\n  margin: 0 auto;\n  width: 100%;\n  bottom: 300px;\n  top: 70%;\n  height: 69px;\n  box-sizing: border-box;\n  text-align: center;\n  display: flex;\n  justify-content: center;\n}\n.danmu-control div[data-v-c40519ec] {\n  width: 300px;\n  background: rgba(0, 0, 0, 0.6);\n  padding: 15px;\n  border-radius: 5px;\n  border: 2px solid #8ad9ff;\n}\n.danmu-control input[data-v-c40519ec], .danmu-control button[data-v-c40519ec], .danmu-control select[data-v-c40519ec] {\n  height: 35px;\n  padding: 0;\n  float: left;\n  background: #027fbb;\n  border: 1px solid #CCC;\n  color: #FFF;\n  border-radius: 0;\n  width: 18%;\n  box-sizing: border-box;\n}\n.danmu-control select[data-v-c40519ec] {\n  height: 33px;\n  margin-top: 1px;\n  border: 0px;\n  outline: 1px solid #cccccc;\n}\n.danmu-control input[data-v-c40519ec] {\n  width: 64%;\n  height: 35px;\n  background: rgba(0, 0, 0, 0.7);\n  border: 1px solid #8ad9ff;\n  padding-left: 5px;\n  color: #FFF;\n}", ""]);

// exports


/***/ }),

/***/ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true&":
/*!*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/style-loader!./node_modules/css-loader!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src??ref--7-2!./node_modules/sass-loader/dist/cjs.js??ref--7-3!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true& ***!
  \*************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {


var content = __webpack_require__(/*! !../../../../../node_modules/css-loader!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--7-2!../../../../../node_modules/sass-loader/dist/cjs.js??ref--7-3!../../../../../node_modules/vue-loader/lib??vue-loader-options!./barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true& */ "./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true&");

if(typeof content === 'string') content = [[module.i, content, '']];

var transform;
var insertInto;



var options = {"hmr":true}

options.transform = transform
options.insertInto = undefined;

var update = __webpack_require__(/*! ../../../../../node_modules/style-loader/lib/addStyles.js */ "./node_modules/style-loader/lib/addStyles.js")(content, options);

if(content.locals) module.exports = content.locals;

if(false) {}

/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=template&id=c40519ec&scoped=true&":
/*!**************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib??vue-loader-options!./resources/js/views/web/home/barrage.vue?vue&type=template&id=c40519ec&scoped=true& ***!
  \**************************************************************************************************************************************************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "render", function() { return render; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return staticRenderFns; });
var render = function() {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { attrs: { id: "barrage" } }, [
    _c(
      "div",
      { staticClass: "stage" },
      [
        _c("vue-baberrage", {
          attrs: {
            isShow: _vm.barrageIsShow,
            barrageList: _vm.barrageList,
            loop: _vm.barrageLoop,
            maxWordCount: 60
          }
        })
      ],
      1
    ),
    _vm._v(" "),
    _c("div", { staticClass: "danmu-control" }, [
      _c("div", [
        _c(
          "select",
          {
            directives: [
              {
                name: "model",
                rawName: "v-model",
                value: _vm.position,
                expression: "position"
              }
            ],
            on: {
              change: function($event) {
                var $$selectedVal = Array.prototype.filter
                  .call($event.target.options, function(o) {
                    return o.selected
                  })
                  .map(function(o) {
                    var val = "_value" in o ? o._value : o.value
                    return val
                  })
                _vm.position = $event.target.multiple
                  ? $$selectedVal
                  : $$selectedVal[0]
              }
            }
          },
          [
            _c("option", { attrs: { value: "abc" } }, [_vm._v("从右")]),
            _vm._v(" "),
            _c("option", { attrs: { value: "top" } }, [_vm._v("从上")])
          ]
        ),
        _vm._v(" "),
        _c("input", {
          directives: [
            {
              name: "model",
              rawName: "v-model",
              value: _vm.msg,
              expression: "msg"
            }
          ],
          staticStyle: { float: "left" },
          attrs: { type: "text" },
          domProps: { value: _vm.msg },
          on: {
            input: function($event) {
              if ($event.target.composing) {
                return
              }
              _vm.msg = $event.target.value
            }
          }
        }),
        _vm._v(" "),
        _c(
          "button",
          {
            staticStyle: { float: "left" },
            attrs: { type: "button" },
            on: { click: _vm.sendMsg }
          },
          [_vm._v("发送")]
        )
      ])
    ])
  ])
}
var staticRenderFns = []
render._withStripped = true



/***/ }),

/***/ "./resources/js/common.js":
/*!********************************!*\
  !*** ./resources/js/common.js ***!
  \********************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vue */ "./node_modules/vue/dist/vue.common.js");
/* harmony import */ var vue__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(vue__WEBPACK_IMPORTED_MODULE_0__);

/* harmony default export */ __webpack_exports__["default"] = (new vue__WEBPACK_IMPORTED_MODULE_0___default.a());

/***/ }),

/***/ "./resources/js/views/web/home/barrage.vue":
/*!*************************************************!*\
  !*** ./resources/js/views/web/home/barrage.vue ***!
  \*************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _barrage_vue_vue_type_template_id_c40519ec_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./barrage.vue?vue&type=template&id=c40519ec&scoped=true& */ "./resources/js/views/web/home/barrage.vue?vue&type=template&id=c40519ec&scoped=true&");
/* harmony import */ var _barrage_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./barrage.vue?vue&type=script&lang=js& */ "./resources/js/views/web/home/barrage.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport *//* harmony import */ var _barrage_vue_vue_type_style_index_0_id_c40519ec_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true& */ "./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");






/* normalize component */

var component = Object(_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_3__["default"])(
  _barrage_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _barrage_vue_vue_type_template_id_c40519ec_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"],
  _barrage_vue_vue_type_template_id_c40519ec_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"],
  false,
  null,
  "c40519ec",
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/views/web/home/barrage.vue"
/* harmony default export */ __webpack_exports__["default"] = (component.exports);

/***/ }),

/***/ "./resources/js/views/web/home/barrage.vue?vue&type=script&lang=js&":
/*!**************************************************************************!*\
  !*** ./resources/js/views/web/home/barrage.vue?vue&type=script&lang=js& ***!
  \**************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib??ref--4-0!../../../../../node_modules/vue-loader/lib??vue-loader-options!./barrage.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=script&lang=js&");
/* empty/unused harmony star reexport */ /* harmony default export */ __webpack_exports__["default"] = (_node_modules_babel_loader_lib_index_js_ref_4_0_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true&":
/*!***********************************************************************************************************!*\
  !*** ./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true& ***!
  \***********************************************************************************************************/
/*! no static exports found */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_7_2_node_modules_sass_loader_dist_cjs_js_ref_7_3_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_style_index_0_id_c40519ec_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/style-loader!../../../../../node_modules/css-loader!../../../../../node_modules/vue-loader/lib/loaders/stylePostLoader.js!../../../../../node_modules/postcss-loader/src??ref--7-2!../../../../../node_modules/sass-loader/dist/cjs.js??ref--7-3!../../../../../node_modules/vue-loader/lib??vue-loader-options!./barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true& */ "./node_modules/style-loader/index.js!./node_modules/css-loader/index.js!./node_modules/vue-loader/lib/loaders/stylePostLoader.js!./node_modules/postcss-loader/src/index.js?!./node_modules/sass-loader/dist/cjs.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=style&index=0&id=c40519ec&lang=scss&scoped=true&");
/* harmony import */ var _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_7_2_node_modules_sass_loader_dist_cjs_js_ref_7_3_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_style_index_0_id_c40519ec_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(_node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_7_2_node_modules_sass_loader_dist_cjs_js_ref_7_3_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_style_index_0_id_c40519ec_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__);
/* harmony reexport (unknown) */ for(var __WEBPACK_IMPORT_KEY__ in _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_7_2_node_modules_sass_loader_dist_cjs_js_ref_7_3_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_style_index_0_id_c40519ec_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__) if(["default"].indexOf(__WEBPACK_IMPORT_KEY__) < 0) (function(key) { __webpack_require__.d(__webpack_exports__, key, function() { return _node_modules_style_loader_index_js_node_modules_css_loader_index_js_node_modules_vue_loader_lib_loaders_stylePostLoader_js_node_modules_postcss_loader_src_index_js_ref_7_2_node_modules_sass_loader_dist_cjs_js_ref_7_3_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_style_index_0_id_c40519ec_lang_scss_scoped_true___WEBPACK_IMPORTED_MODULE_0__[key]; }) }(__WEBPACK_IMPORT_KEY__));


/***/ }),

/***/ "./resources/js/views/web/home/barrage.vue?vue&type=template&id=c40519ec&scoped=true&":
/*!********************************************************************************************!*\
  !*** ./resources/js/views/web/home/barrage.vue?vue&type=template&id=c40519ec&scoped=true& ***!
  \********************************************************************************************/
/*! exports provided: render, staticRenderFns */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_template_id_c40519ec_scoped_true___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib??vue-loader-options!./barrage.vue?vue&type=template&id=c40519ec&scoped=true& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js?!./node_modules/vue-loader/lib/index.js?!./resources/js/views/web/home/barrage.vue?vue&type=template&id=c40519ec&scoped=true&");
/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "render", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_template_id_c40519ec_scoped_true___WEBPACK_IMPORTED_MODULE_0__["render"]; });

/* harmony reexport (safe) */ __webpack_require__.d(__webpack_exports__, "staticRenderFns", function() { return _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_barrage_vue_vue_type_template_id_c40519ec_scoped_true___WEBPACK_IMPORTED_MODULE_0__["staticRenderFns"]; });



/***/ })

}]);