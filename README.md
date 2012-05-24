## Hedbergism

This is just a REALLY simple RubyGem that will return a random Mitch Hedberg quote.  I decided to do this after taking a course on Ruby - I thought I could force it into being a little more complicated to test some of what I learned.... but this is about as simple as it gets.

From a pure OO standpoint, there probably are some issues with this implementation, regardless of how simple it is.  The Quote object probably shouldn't handle printing to the screen.  But that's how I did it... maybe I'll enhance it that.  Maybe make a Printable mix-in that handle outputting in different format?

## Usage
		hedbergism [options]
			where [options] are:
				   --file, -f:   Alternate file to get quotes from. File must be "~~" delimited
   				--version, -v:   Print version and exit
      			   --help, -h:   Show this message
## Examples

With no parameters:

		 > hedbergism
		################################################################################
		#                                                                              #
		# A burrito is a sleeping bag for ground beef.                                 #
		#                                                                              #
		################################################################################

With parameter passing a custom file:

		> hedbergism -f /Users/dmbrooking/Dev/hedbergism/bin/quotes.csv
		################################################################################
		#                                                                              #
		# I was walking down the street the other day when this guy asked if I         #
		# wanted a frozen banana...I said 'no' but then thought I might want a         #
		# regular banana later, so...yeah.                                             #
		#                                                                              #
		################################################################################
		
