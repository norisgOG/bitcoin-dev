//
//

#ifndef BASE58_ATTRIBUTES_H
#define BASE58_ATTRIBUTES_H

#if defined(__clang__)
#  if __has_attribute(lifetimebound)
#    define LIFETIMEBOUND [[clang::lifetimebound]]
#  else
#    define LIFETIMEBOUND
#  endif
#else
#  define LIFETIMEBOUND
#endif

#endif //BASE58_ATTRIBUTES_H
