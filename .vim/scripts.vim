if did_filetype()
    finish
endif

if getline(1) =~ '^#\sRT.*Rev'
    setfiletype yamaha
endif
