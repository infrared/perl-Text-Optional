Text-Optional
=============



### Why


Initial reason for this module was to parse Cisco IOS command line syntax for quiz purposes.

Given:

    conf(igure) t(erminal)
 
The text enclosed by parentheses are optional, and any sequence of optional text will return as valid.

For the above example, the following tests will return true:

    conf t
    confi term
    configure t
    conf terminal
    
 and so on..
 
### Syntax

    use Text::Optional;
    my $ob = Text::Optional->new;
     
    my $valid = 'conf(igure) t(erminal)';
    my $test  = 'conf ter';
      
    $ob->check($valid, $test) ? print  "yup" : print "nope";
 
 
 
