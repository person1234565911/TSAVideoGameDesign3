

if (pushcheck) {
    instance_destroy(inst_60A5BE94);
    instance_destroy(self);
}
if (!place_meeting(x, y, Objpush) or !place_meeting(x, y, objPlayer)) {
    pushcheck = false;
}