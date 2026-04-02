(**
	copy and invert the current layer mask in a selected variant
**)

tell application "Capture One"
	
	if not (exists current document) then
		display dialog "No document open."
		return
	end if
	
	set selectedVariants to selected variants
	if (count of selectedVariants) = 0 then
		display dialog "No image selected."
		return
	end if
	
	set selectedVariant to item 1 of selectedVariants
	
	set currentLayer to current layer of selectedVariant
	set currentLayerName to name of currentLayer
	set invertedLayerName to "inverted " & currentLayerName
	
	set invertedLayer to make new layer of selectedVariant with properties {name:invertedLayerName}
	
	copy mask currentLayer to layer invertedLayer
	invert mask invertedLayer
	
end tell
