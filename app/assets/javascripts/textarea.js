function js_show(acc) {
	cur_attr = $(acc).attr("class");
	//$(".tr_line_dropdown").empty();

	if (cur_attr != "dropdown_box dropdown_open") {

		//$(acc + " .tr_line_dropdown").append(r);

		$(".dropdown_open").slideToggle("fast");
		$(".dropdown_open").attr({class: "dropdown_box"});

		$(acc).slideToggle("fast");
		attr = $(acc).attr("class");
		$(acc).attr({class: attr + ' ' + 'dropdown_open'});
	}

	if (cur_attr == "dropdown_box dropdown_open") {
		$(".dropdown_open").slideToggle("fast");
		$(".dropdown_open").attr({class: "dropdown_box"});
	}
}