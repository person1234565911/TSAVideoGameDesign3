

if (pushcheck && !instance_exists(inst_63B51307)) {
    instance_destroy(inst_51740530);
}
if (!place_meeting(x, y, Objpush) or !place_meeting(x, y, objPlayer)) {
    pushcheck = false;
}