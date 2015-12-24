function fsize
	ls -lah $argv | awk '{ print $5}'
end
