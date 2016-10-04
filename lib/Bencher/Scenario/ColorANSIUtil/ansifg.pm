package Bencher::Scenario::ColorANSIUtil::ansifg;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark ansifg()',
    participants => [
        {
            fcall_template => 'Color::ANSI::Util::ansi16fg(<rgb>)',
        },
        {
            fcall_template => 'Color::ANSI::Util::ansi256fg(<rgb>)',
        },
        {
            fcall_template => 'Color::ANSI::Util::ansi24bfg(<rgb>)',
        },
    ],
    datasets => [
        { args => { rgb => '000000' } },
        { args => { rgb => 'eeeeef' } },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

We can see the overhead of C<_rgb_to_indexed()> in the C<ansi16fg()> and
C<ansi256fg()> functions. For colors that immediately result in an exact match
like C<000000>, the overhead is smaller. For colors that need calculation of
minimum square distance like C<eeeeef>, the overhead is larger.

Although in general we do not need to worry about this overhead unless we're
calculating colors at rates of hundreds of thousands per seconds.


=head1 SEE ALSO
