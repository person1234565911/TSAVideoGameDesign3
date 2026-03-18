

if (pushcheck) {
    instance_destroy(inst_1FBE571);
}
if (!place_meeting(x, y, Objpush) or !place_meeting(x, y, objPlayer)) {
    pushcheck = false;
}