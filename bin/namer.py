#!/usr/bin/env python

# Name generating code
# Copyright (c) 2010 Ninite.com
#
# Released into the public domain - enjoy!
#
# Story at http://blog.ninite.com/post/620277259/how-ninite-was-named-by-a-computer-program

from datetime import datetime, date
import random
import re
import socket

words = []

for w in open('/usr/share/dict/words'):
    w = w.lower().strip()
    words.append(w)

def available(name):
    whois = ('199.7.52.74', 43) # whois.internic.net
    s = socket.create_connection(whois)
    domain = name+'.com'
    s.send('=%s\r\n' % domain)
    response = s.recv(4096)
    new = s.recv(4096)
    while new:
        response += new
        new = s.recv(4096)
    w = parse_whois(response, domain)
    if not w or w['Expiration Date'] < date.today():
        return True
    return False

def parse_whois(response, domain):
    '''best to query with =domain\r\n so we get all records
       (see google.com)
    '''
    m = re.search(r'\n([ ]+Domain Name: %s.+?)\n\n' % domain.upper(),
                  response, re.S | re.M )
    if m:
        r = {}
        for k,v in [ l.strip().split(': ') for l in m.group(1).split('\n') ]:
            if k.endswith(" Date"):
                v = datetime.strptime(v, '%d-%b-%Y').date()
            if k in r:
                if type(r[k]) == list:
                    r[k].append(v)
                else:
                    r[k] = [r[k], v]
            else:
                r[k] = v
        return r
    return None

def make_ngrams(n=3):
    ngrams = {}
    for w in words:
        p = n
        while p < len(w):
            next = w[p]
            gram = w[p-n:p]
            if gram not in ngrams:
                ngrams[gram] = [next]
            else:
                ngrams[gram].append(next)
            p += 1
    return ngrams

def ngrams_word(ngrams, length=6):
    w = random.choice(ngrams.keys())
    n = len(w)
    while len(w) < length:
        options = ngrams.get(w[-n:])
        if not options:
            break
        w += random.choice(options)
    return w

def presuff_word(pre=3, suf=3):
    w = random.choice(words)[:pre]
    w += random.choice(words)[-suf:]
    return w

#ngrams = make_ngrams(3)
for i in range(100):
    names = [ presuff_word() for i in range(20) ]
    names = [ n for n in names if available(n) ]
    print names
