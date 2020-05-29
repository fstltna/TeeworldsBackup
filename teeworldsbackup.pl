#!/usr/bin/perl

# Set these for your situation
my $TEEWORLDSDATADIR = "/usr/share/games/teeworlds/data";
my $BACKUPDIR = "/home/twowner/backups";
my $TARCMD = "/bin/tar czf";

#-------------------
# No changes below here...
#-------------------
my $VERSION = "2.0";

print "Teeworlds Backup version $VERSION\n";
print "========================\n";
if (! -d $BACKUPDIR)
{
	print "Backup dir $BACKUPDIR not found, creating...\n";
	system("mkdir -p $BACKUPDIR");
}
print "Moving existing backups: ";

if (-f "$BACKUPDIR/teeworldsnbackup-5.tgz")
{
	unlink("$BACKUPDIR/teeworldsnbackup-5.tgz")  or warn "Could not unlink $BACKUPDIR/teeworldsnbackup-5.tgz: $!";
}
if (-f "$BACKUPDIR/teeworldsnbackup-4.tgz")
{
	rename("$BACKUPDIR/teeworldsnbackup-4.tgz", "$BACKUPDIR/teeworldsnbackup-5.tgz");
}
if (-f "$BACKUPDIR/teeworldsnbackup-3.tgz")
{
	rename("$BACKUPDIR/teeworldsnbackup-3.tgz", "$BACKUPDIR/teeworldsnbackup-4.tgz");
}
if (-f "$BACKUPDIR/teeworldsnbackup-2.tgz")
{
	rename("$BACKUPDIR/teeworldsnbackup-2.tgz", "$BACKUPDIR/teeworldsnbackup-3.tgz");
}
if (-f "$BACKUPDIR/teeworldsnbackup-1.tgz")
{
	rename("$BACKUPDIR/teeworldsnbackup-1.tgz", "$BACKUPDIR/teeworldsnbackup-2.tgz");
}
print "Done\nCreating New Backup: ";
system("$TARCMD $BACKUPDIR/teeworldsnbackup-1.tgz $TEEWORLDSDATADIR");
print("Done!\n");
exit 0;
