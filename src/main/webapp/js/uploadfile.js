/**
 * 此JQuery扩展提供简便的上传功能.需要配合icity-mvc框架的SingleFileUploadController一起使用.
 *
 * Version 2.0.0
 *
 * Created by dylan.chen on 11/25/14.
 */
(function(jQuery){

    var CONFIG_TYPE = "fileUploadType";

    var CONFIG_STRATEGY = "fileUploadStrategy";

    var CONFIG_BUTTON_CLASS = "fileUploadButtonClass";

    var CONFIG_IMAGE_PREVIEW_ELEMENT_CLASS = "imagePreviewElementClass";

    var BUTTON_ATTR_ELEMENT_ID = "elementId";

    var defaultsConfig = {
        buttons:{
            upload:"上传", //"上传"按钮的文本
            clear:"清空", //"清空"按钮的文本
            reset:"重置" //"重置"按钮的文本
        }
    }

    jQuery.fn.xllUploadFile = function(config){
        this.each(function(){
            var element = jQuery(this);
            var _config = new Object();
            if(typeof (config) == "undefined"){
                jQuery.extend(true,_config,defaultsConfig);
                resolveConfigFromElementAttr(element,_config);
            }else{
                jQuery.extend(true,_config,defaultsConfig);
                jQuery.extend(true,_config,config);
            }
            renderElement(element,_config);
        });
    }

    function resolveConfigFromElementAttr(element,config){
        config[CONFIG_TYPE] = element.attr(CONFIG_TYPE); //上传文件类型
        config[CONFIG_STRATEGY] = element.attr(CONFIG_STRATEGY); //上传策略
        config[CONFIG_BUTTON_CLASS] = element.attr(CONFIG_BUTTON_CLASS); //上传按钮的class
        config[CONFIG_IMAGE_PREVIEW_ELEMENT_CLASS] = element.attr(CONFIG_IMAGE_PREVIEW_ELEMENT_CLASS); //图片预览元素的class
    }

    function renderElement(element,config){

        var type=config[CONFIG_TYPE] ||"file";
        var strategy=config[CONFIG_STRATEGY] || type;
        var buttonClass=config[CONFIG_BUTTON_CLASS];
        var imagePreviewElementClass=config[CONFIG_IMAGE_PREVIEW_ELEMENT_CLASS];

        var elementValue = element.attr("value")
        if(typeof (elementValue) != "undefined"){
            element.attr("initValue",elementValue);
        }

        var elementId = element.attr("id");
        if(typeof (elementId) == "undefined"){
            elementId="file-upload-element-" + Math.floor(Math.random() * ( 100 + 1));
            element.attr("id",elementId);
        }

        var div = jQuery("<div/>");
        div.attr("id", elementId + "-div");
        element.before(div);

        var uploadButton = renderButton(config.buttons.upload,buttonClass,strategy,elementId,openFileBox);

        var clearButton = renderButton(config.buttons.clear,buttonClass,strategy,elementId,clearElement);

        var resetButton = renderButton(config.buttons.reset,buttonClass,strategy,elementId,resetElement);

        div.append(element, uploadButton,clearButton,resetButton);

        if(type == "image") {
            div.append(jQuery("<br/>"),renderImagePreviewElement(strategy,elementId,elementValue,imagePreviewElementClass));
        }
    }

    function renderImagePreviewElement(strategy,elementId,elementValue,imagePreviewElementClass){
        var img = jQuery("<img/>");

        img.attr("id", getImagePreviewElementId(elementId));

        if(typeof (imagePreviewElementClass) != "undefined"){
            img.addClass(imagePreviewElementClass);
        }else{
            img.css("border","2px solid #cdcdcd");
            img.css("margin","3px");
            img.css("width", 145);
            img.css("height", 136);
        }

        if(typeof (elementValue) != "undefined" && trimString(elementValue).length > 0){
            jQuery.get(getBaseServerUrl()+"upload/file/fileurl",{"fileUploadStrategyId":strategy,"relativePath":elementValue},function(fileUrl){
                loadImageToImagePreviewElement(img,fileUrl);
            });
        }else{
            loadImageToImagePreviewElement(img,getDefaultPreviewImageUrl());
        }
        return img;
    }

    function getImagePreviewElementId(elementId){
        return elementId + "-image-preview";
    }

    function getDefaultPreviewImageUrl(){
        return getBaseServerUrl()+"img/no_picture.gif";
    }

    function loadImageToImagePreviewElement(element,imgUrl){
        var previewImageElement = element;
        if(typeof(element)=="string"){//上传成功后,重新设置图片预览框
            var previewImageElement=$("#"+getImagePreviewElementId(element));
        }else{
            element.attr("initSrc",imgUrl);
        }
        previewImageElement.attr("src",imgUrl);
    }

    function renderButton(name,buttonClass,strategy,elementId,onclick){
        var button = jQuery("<input/>");
        button.attr("type", "button");
        button.attr("value", name);
        button.attr(CONFIG_STRATEGY, strategy);
        button.attr(BUTTON_ATTR_ELEMENT_ID,elementId);
        if(typeof (buttonClass) != "undefined"){
            button.addClass(buttonClass);
        }else{
            button.css("margin-left","3px");
        }

        button.click(onclick);

        return button;
    }

    /**
     * 去除字符串的前导空格、尾随空格和行终止符
     */
    function trimString(str){
        str = str.replace(/^(\s|\u00A0)+/,'');
        for(var i=str.length-1; i>=0; i--){
            if(/\S/.test(str.charAt(i))){
                str = str.substring(0, i+1);
                break;
            }
        }
        return str;
    }

    function getBaseServerUrl(){
        return window.baseServerUrl;
    }

    function openFileBox(){
        var element=jQuery(this);
        var fileUploadStrategy = element.attr(CONFIG_STRATEGY);
        var writeBackElementId = element.attr(BUTTON_ATTR_ELEMENT_ID);
        var url=getBaseServerUrl()+"upload/file/box"+"?fileUploadStrategyId="+fileUploadStrategy+"&writeBackElementId="+writeBackElementId;
        jQuery.jBox("iframe:"+url, {
            title: "文件上传",
            width: 350,
            height: 130,
            buttons: { 'close': true },
            iframeScrolling: "no"
        });
    }

    /**
     * 重置文件上传表单元素
     *
     * 参数说明：
     *     elementId   文件上传表单元素的id
     */
    function resetElement(){
        var elementId = jQuery(this).attr(BUTTON_ATTR_ELEMENT_ID);
        var element = jQuery("#"+elementId);
        element.attr("value", element.attr("initValue"));
        var previewImgElement = jQuery("#" + getImagePreviewElementId(elementId));
        previewImgElement.attr("src", previewImgElement.attr("initSrc"));
    }

    /**
     * 清空文件上传表单元素
     *
     * 参数说明：
     *     elementId   文件上传表单元素的id
     */
    function clearElement(){
        var elementId = jQuery(this).attr(BUTTON_ATTR_ELEMENT_ID);
        var element = jQuery("#"+elementId);
        element.attr("value", "");
        jQuery("#" + getImagePreviewElementId(elementId)).attr("src", getDefaultPreviewImageUrl())
    }

    /**
     *文件上传回调函数，用于接收文件上传后，服务端返回的结果.
     *
     *参数说明：
     *	result: 结果，0 成功,1 失败
     *	desc: 结果说明
     *	absPath： 上传文件保存的绝对路径,用于页面预览
     *	relaPath： 上传文件保存的相对路径
     *	writeBackElementId：回写信息的页面元素的ID
     */
    window.fileUploadCallback = function (result,desc,absPath,relaPath,writeBackElementId){
        jQuery.jBox.close(true);
        if(result==0){
            jQuery("#"+writeBackElementId).attr("value",relaPath);
            loadImageToImagePreviewElement(writeBackElementId,absPath);
            jQuery.jBox.success('上传成功', '');
        }else{
            jQuery.jBox.error(desc, '上传失败');
        }
    }

})(jQuery);

jQuery(document).ready(function(){
    jQuery("input[fileUploadType]").xllUploadFile();
});
