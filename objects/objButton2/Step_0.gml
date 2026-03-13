

if (pushcheck) {
    instance_destroy(inst_6B74322E);
}
if (!place_meeting(x, y, Objpush) or !place_meeting(x, y, objPlayer)) {
    pushcheck = false;
}