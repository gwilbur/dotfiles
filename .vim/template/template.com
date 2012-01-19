$ on warning then goto BOMB
$
$ DONE:
$   exit 1
$
$ BOMB:
$   exit 4
