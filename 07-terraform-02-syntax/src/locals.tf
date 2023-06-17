locals {
 web_project = "${var.vm_name_instance.project}-${var.vm_name_instance.dev}-${var.vm_name_instance.platf}-web"
 db_project = "${var.vm_name_instance.project}-${var.vm_name_instance.dev}-${var.vm_name_instance.platf}-db"
}
