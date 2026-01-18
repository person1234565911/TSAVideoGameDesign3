function Transitions(){
	function TransitionPlaceSequence(_type)
	{
		if (layer_exists("transition")) layer_destroy("transition");
		var _lay = layer_create(-9999,"transition");
		layer_sequence_create(_lay,0,0,_type);
	}
}