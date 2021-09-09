[![Actions Status](https://github.com/lizmat/P5times/workflows/test/badge.svg)](https://github.com/lizmat/P5times/actions)

NAME
====

Raku port of Perl's times() built-in

SYNOPSIS
========

    use P5times; # exports times()

    ($user,$system,$cuser,$csystem) = times;

    $user = times(Scalar);

DESCRIPTION
===========

This module tries to mimic the behaviour of Perl's `times` built-in as closely as possible in the Raku Programming Language.

ORIGINAL PERL DOCUMENTATION
===========================

    times   Returns a four-element list giving the user and system times in
            seconds for this process and any exited children of this process.

                ($user,$system,$cuser,$csystem) = times;

            In scalar context, "times" returns $user.

            Children's times are only included for terminated children.

            Portability issues: "times" in perlport.

PORTING CAVEATS
===============

Microseconds vs Seconds
-----------------------

Due to a misunderstanding, it was found that the the `times` function returns **microseconds** versus seconds (as the original Perl version does). This was only found after two years of this module's existence, and deemed much more useful in the Raku context.

Therefore it was decided to keep this behaviour in December 2020.

Child process information
-------------------------

There is currently no way to obtain the usage information of child processes.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/P5times . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2019, 2020, 2021 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

