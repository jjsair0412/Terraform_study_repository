data "template_file" "init-script" {
    template = "${file("${path.module}/script/init.cfg")}"
    vars = {
        REGION = var.MAIN_2_REGION
    }
}

data "template_file" "shell-script" {
    template = "${file("${path.module}/script/volumes.sh")}"
    vars = {
        DEVICE = var.VOLUME_INSTANCE_DEVICE_NAME
    }
}

data "template_cloudinit_config" "cloudinit-example" {
    gzip = false
    base64_encode = false
    part {
        filename = "init.cfg"
        content_type = "text/cloud-config"
        content = "${data.template_file.init-script.rendered}"
    }

    part {
        content_type = "text/x-shellscript"
        content = "${data.template_file.shell-script.rendered}"
    }
}