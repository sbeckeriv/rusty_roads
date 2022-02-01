use css_inline;
#[macro_use]
extern crate rutie;

use rutie::{Class, Object, RString, VM};

class!(RustyRoads);

methods!(
    RustyRoads,
    _rtself,
    fn pub_inline(input: RString) -> RString {
        let ruby_string = input.map_err(|e| VM::raise_ex(e)).unwrap();
        let inlined = css_inline::inline(ruby_string.to_str()).unwrap_or_default();
        RString::new_utf8(&inlined)
    }
);

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_rusty_roads() {
    Class::new("RustyRoads", None).define(|klass| {
        klass.def_self("inline", pub_inline);
    });
}
