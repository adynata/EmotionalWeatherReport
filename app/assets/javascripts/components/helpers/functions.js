'use strict';
var Functions = {
  getMetaContent: function(name){
    let metas = $('meta').toArray();

    metas.forEach((meta) => {
      if (meta.getAttribute("name") == name) {
        return meta.getAttribute("content");
      }
      return "";
    });
  }
};

module.exports = Functions;
