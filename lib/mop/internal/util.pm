package mop::internal::util;

use strict;
use warnings;

our $VERSION   = '0.01';
our $AUTHORITY = 'cpan:STEVAN';

## ------------------------------------------------------------------
## ERROR HANDLING
## ------------------------------------------------------------------

sub THROW { die join '' => '[', shift, '] ', @_ }

sub CATCH {
    # allow our own error objects to be 
    # handled sensibly, fuck everyone else
    return $_[0] if mop::util::BLESSED( $_[0] ) && $_[0]->isa('mop::internal::util::error');
    my ($type, $msg) = ($_[0] =~ /^\[(.*)\] (.*)/);
    return $e_class->new( type => $type, msg => $msg ); 
}

## ------------------------------------------------------------------

1;

__END__




