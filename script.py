print 'Welcome to the Pig Latin Translator!'

original = raw_input("What's your name?")
empty_string = ""
if len(original) > 0 and original.isalpha():
        print original
else: print "empty"
