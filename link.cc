#include "link.h"

Link::Link(string k, string d, Link* nx):key(k),data(d),next(nx){}

Link::Link(const Link& t):key(t.key),data(t.data),next(t.next){}




