use v6.*;

unit module P5times:ver<0.0.9>:auth<cpan:ELIZABETH>;

my proto sub times(|) is export {*}
multi sub times(Scalar:U) {
    use nqp;
    nqp::getrusage(my int @rusage);
    nqp::atpos_i(@rusage, nqp::const::RUSAGE_UTIME_SEC) * 1000000
      + nqp::atpos_i(@rusage, nqp::const::RUSAGE_UTIME_MSEC)
}
multi sub times() {
    use nqp;
    nqp::getrusage(my int @rusage);
    (
      nqp::atpos_i(@rusage, nqp::const::RUSAGE_UTIME_SEC) * 1000000
        + nqp::atpos_i(@rusage, nqp::const::RUSAGE_UTIME_MSEC),
      nqp::atpos_i(@rusage, nqp::const::RUSAGE_STIME_SEC) * 1000000
        + nqp::atpos_i(@rusage, nqp::const::RUSAGE_STIME_MSEC),
      0,
      0
    )
}

=begin pod

=head1 NAME

Raku port of Perl's times() built-in

=head1 SYNOPSIS

  use P5times; # exports times()

  ($user,$system,$cuser,$csystem) = times;

  $user = times(Scalar);

=head1 DESCRIPTION

This module tries to mimic the behaviour of Perl's C<times> built-in as
closely as possible in the Raku Programming Language.

=head1 ORIGINAL PERL DOCUMENTATION

    times   Returns a four-element list giving the user and system times in
            seconds for this process and any exited children of this process.

                ($user,$system,$cuser,$csystem) = times;

            In scalar context, "times" returns $user.

            Children's times are only included for terminated children.

            Portability issues: "times" in perlport.

=head1 PORTING CAVEATS

=head2 Microseconds vs Seconds

Due to a misunderstanding, it was found that the the C<times> function returns
B<microseconds> versus seconds (as the original Perl version does).  This was
only found after two years of this module's existence, and deemed much more
useful in the Raku context.

Therefore it was decided to keep this behaviour in December 2020.

=head2 Child process information

There is currently no way to obtain the usage information of child processes.

=head1 AUTHOR

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/P5times . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018-2020 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
