/client/proc/dsay(msg as text)
	set category = "Special Verbs"
	set name = "Dsay" //Gave this shit a shorter name so you only have to time out "dsay" rather than "dead say" to use it --NeoFite
	set hidden = 1
	//	All admins should be authenticated, but... what if?
	if(!src.authenticated || !src.holder)
		src << "Only administrators may use this command."
		return
	if(!src.mob)
		return
	if(src.muted)
		return

	msg = copytext(sanitize(msg), 1, MAX_MESSAGE_LEN)
	log_admin("[key_name(src)] : [msg]")

	if (!msg)
		return
	for (var/mob/M in mobz)
		if(M.stat == 2 || (M.client && M.client.holder))
			M.ctab_message("Dead", "<span class='game deadsay'><span class='prefix'>DEAD:</span> <span class='name'>ADMIN([M.key])</span> says, <span class='message'>\"[msg]\"</span></span>")