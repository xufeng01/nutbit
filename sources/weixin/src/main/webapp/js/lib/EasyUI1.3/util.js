
/**
 * 弹出框
 * @param url
 * @param width
 * @param height
 * @param title
 */
function showDialog(url, width, height, title) {
	creadElem("winb", "div");
	var e = $("#winb");
	var iframe = "<iframe width='100%' height='100%' frameborder=0 scrolling=auto src='"
			+ url + "'></iframe>";
	e.window( {
		width : width,
		height : height,
		modal : true,
		closed : true,
		top : ($(window).height() - height) * 0.5,
		left : ($(window).width() - width) * 0.5,
		minimizable : false,
		maximizable : false,
		collapsible:false,
		draggable:true,
		resizable : false,
		title : title
	});
	e.window("open");
	e.html(iframe);//务必open以后才能加载iframe，否则会出现3次加载iframe问题
}

function creadElem(b, a) {
	var c = document.createElement(a);
	c.id = b;
	document.body.appendChild(c);
}

/**
 * 关闭窗口
 */
function closeDialog() {
	$("#winb").window("close");
};

$.fn.extend({
	/** 
     * 修改DataGrid对象的默认大小，以适应页面宽度。 
     *  
     * @param heightMargin 
     *            高度对页内边距的距离。 
     * @param widthMargin 
     *            宽度对页内边距的距离。 
     * @param minHeight 
     *            最小高度。 
     * @param minWidth 
     *            最小宽度。 
     *  
     */  
	 resizeDataGrid : function() {  
	        var height = $(parent.document.body).height()*0.72;  
	        var width = $(document.body).width()-15;  
	  
	        $(this).datagrid('resize', {  
	            height : height,  
	            width : width  
	        });  
	    },
		/** 
		 * 修改DataGrid对象的默认大小，以适应页面宽度。 
		 *  
		 * @param heightMargin 
		 *            高度对页内边距的距离。 
		 * @param widthMargin 
		 *            宽度对页内边距的距离。 
		 * @param minHeight 
		 *            最小高度。 
		 * @param minWidth 
		 *            最小宽度。 
		 *  
		 */  
		 resizeDataGrid2 : function() {  
		        var height = $(parent.document.body).height()*0.72;  
		        var width = $(document.body).width()-15-$('#ztree').width();  
		        $('#ztree').height($(parent.document.body).height()*0.77);
		        $(this).datagrid('resize', {  
		            height : height,  
		            width : width  
		        });  
		    }

}); 
