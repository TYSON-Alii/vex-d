module vex;

template vex_t(Type) {
    struct vex2 {
        Type x, y;
        this(Type v) { x = y = v; };
        this(Type _x, Type _y) { x = _x; y = _y; };
        this(vex2 v) { x = Type(v.x); y = Type(v.y); };
        this(vex3 v) { x = Type(v.x); y = Type(v.y); };
        this(vex4 v) { x = Type(v.x); y = Type(v.y); };
        vex2 opCall() { return this; };
        bool opEquals(Type v) { return (x == v && y == v); };
        bool opEquals(vex2 v) { return (x == Type(v.x) && y == Type(v.y)); };
        bool opEquals(vex3 v) { return (x == Type(v.x) && y == Type(v.y)); };
        bool opEquals(vex4 v) { return (x == Type(v.x) && y == Type(v.y)); };
        ref Type opIndex(int v) { return (v % 2 == 0) ? x : y; };
        auto opIndex(string v1) {
            Type[] arr;
            foreach(i;v1) {
                if (i == 'x')
                    arr ~= x;
                else if (i == 'y')
                    arr ~= y;
			}
            return arr;
		};
        static if (is(Type == bool) == false) {
            vex2 opUnary(string s)() if (s == "-") { return vex2(-x, -y); };
            vex2 opBinary(string s)(Type v) if (s == "+") { return vex2(x+Type(v  ), y+Type(v  )); };
            vex2 opBinary(string s)(vex2 v) if (s == "+") { return vex2(x+Type(v.x), y+Type(v.y)); };
            vex2 opBinary(string s)(vex3 v) if (s == "+") { return vex2(x+Type(v.x), y+Type(v.y)); };
            vex2 opBinary(string s)(vex4 v) if (s == "+") { return vex2(x+Type(v.x), y+Type(v.y)); };
            vex2 opBinary(string s)(Type v) if (s == "-") { return vex2(x-Type(v  ), y-Type(v  )); };
            vex2 opBinary(string s)(vex2 v) if (s == "-") { return vex2(x-Type(v.x), y-Type(v.y)); };
            vex2 opBinary(string s)(vex3 v) if (s == "-") { return vex2(x-Type(v.x), y-Type(v.y)); };
            vex2 opBinary(string s)(vex4 v) if (s == "-") { return vex2(x-Type(v.x), y-Type(v.y)); };
            vex2 opBinary(string s)(Type v) if (s == "*") { return vex2(x*Type(v  ), y*Type(v  )); };
            vex2 opBinary(string s)(vex2 v) if (s == "*") { return vex2(x*Type(v.x), y*Type(v.y)); };
            vex2 opBinary(string s)(vex3 v) if (s == "*") { return vex2(x*Type(v.x), y*Type(v.y)); };
            vex2 opBinary(string s)(vex4 v) if (s == "*") { return vex2(x*Type(v.x), y*Type(v.y)); };
            vex2 opBinary(string s)(Type v) if (s == "/") { return vex2(x/Type(v  ), y/Type(v  )); };
            vex2 opBinary(string s)(vex2 v) if (s == "/") { return vex2(x/Type(v.x), y/Type(v.y)); };
            vex2 opBinary(string s)(vex3 v) if (s == "/") { return vex2(x/Type(v.x), y/Type(v.y)); };
            vex2 opBinary(string s)(vex4 v) if (s == "/") { return vex2(x/Type(v.x), y/Type(v.y)); };
            ref vex2 opOpAssign(string s)(Type v) if (s == "+") { x += Type(v  ); y += Type(v  ); return this; };
            ref vex2 opOpAssign(string s)(vex2 v) if (s == "+") { x += Type(v.x); y += Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex3 v) if (s == "+") { x += Type(v.x); y += Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex4 v) if (s == "+") { x += Type(v.x); y += Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(Type v) if (s == "-") { x -= Type(v  ); y -= Type(v  ); return this; };
            ref vex2 opOpAssign(string s)(vex2 v) if (s == "-") { x -= Type(v.x); y -= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex3 v) if (s == "-") { x -= Type(v.x); y -= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex4 v) if (s == "-") { x -= Type(v.x); y -= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(Type v) if (s == "*") { x *= Type(v  ); y *= Type(v  ); return this; };
            ref vex2 opOpAssign(string s)(vex2 v) if (s == "*") { x *= Type(v.x); y *= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex3 v) if (s == "*") { x *= Type(v.x); y *= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex4 v) if (s == "*") { x *= Type(v.x); y *= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(Type v) if (s == "/") { x /= Type(v  ); y /= Type(v  ); return this; };
            ref vex2 opOpAssign(string s)(vex2 v) if (s == "/") { x /= Type(v.x); y /= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex3 v) if (s == "/") { x /= Type(v.x); y /= Type(v.x); return this; };
            ref vex2 opOpAssign(string s)(vex4 v) if (s == "/") { x /= Type(v.x); y /= Type(v.x); return this; };
        }
        static if (is(Type == float) || is(Type == double)) {
            ref vex2 normalize() {
                const m = (x > y) ? x : y;
                x /= m;
                y /= m;
                return this;
		    };
            vex2 normalize() const {
                const m = (x > y) ? x : y;
                return vex2(x/m, y/m);
		    };
		};
	};
    struct vex3 {
        Type x, y, z;
        this(Type v) { x = y = z = v; };
        this(Type _x, Type _y) { x = _x; y = _y; };
        this(Type _x, Type _y, Type _z) { x = _x; y = _y; z = _z; };
        this(vex2 v) { x = Type(v.x); y = Type(v.y); };
        this(vex3 v) { x = Type(v.x); y = Type(v.y); z = Type(v.z); };
        this(vex4 v) { x = Type(v.x); y = Type(v.y); z = Type(v.z); };
        vex3 opCall() { return this; };
        bool opEquals(Type v) { return (x == Type(v  ) && y == Type(v  ) && z == Type(v)); };
        bool opEquals(vex2 v) { return (x == Type(v.x) && y == Type(v.y)); };
        bool opEquals(vex3 v) { return (x == Type(v.x) && y == Type(v.y) && z == Type(v.z)); };
        bool opEquals(vex4 v) { return (x == Type(v.x) && y == Type(v.y) && z == Type(v.z)); };
        ref Type opIndex(int v) { return (v % 3 == 0) ? x : (v % 3 == 1) ? y : z; };
        auto opIndex(string v1) {
            Type[] arr;
            foreach(i;v1) {
                if (i == 'x')
                    arr ~= x;
                else if (i == 'y')
                    arr ~= y;
                else if (i == 'z')
                    arr ~= z;
			}
            return arr;
		};
        static if (is(Type == bool) == false) {
            vex3 opUnary(string s)() if (s == "-") { return vex3(-x, -y, -z); };
            vex3 opBinary(string s)(Type v) if (s == "+") { return vex3(x+Type(v  ), y+Type(v  ), z+Type(v  )); };
            vex3 opBinary(string s)(vex2 v) if (s == "+") { return vex3(x+Type(v.x), y+Type(v.y), z); };
            vex3 opBinary(string s)(vex3 v) if (s == "+") { return vex3(x+Type(v.x), y+Type(v.y), z+Type(v.z)); };
            vex3 opBinary(string s)(vex4 v) if (s == "+") { return vex3(x+Type(v.x), y+Type(v.y), z+Type(v.z)); };
            vex3 opBinary(string s)(Type v) if (s == "-") { return vex3(x-Type(v  ), y-Type(v  ), z-Type(v  )); };
            vex3 opBinary(string s)(vex2 v) if (s == "-") { return vex3(x-Type(v.x), y-Type(v.y), z); };
            vex3 opBinary(string s)(vex3 v) if (s == "-") { return vex3(x-Type(v.x), y-Type(v.y), z-Type(v.z)); };
            vex3 opBinary(string s)(vex4 v) if (s == "-") { return vex3(x-Type(v.x), y-Type(v.y), z-Type(v.z)); };
            vex3 opBinary(string s)(Type v) if (s == "*") { return vex3(x*Type(v  ), y*Type(v  ), z*Type(v  )); };
            vex3 opBinary(string s)(vex2 v) if (s == "*") { return vex3(x*Type(v.x), y*Type(v.y), z); };
            vex3 opBinary(string s)(vex3 v) if (s == "*") { return vex3(x*Type(v.x), y*Type(v.y), z*Type(v.z)); };
            vex3 opBinary(string s)(vex4 v) if (s == "*") { return vex3(x*Type(v.x), y*Type(v.y), z*Type(v.z)); };
            vex3 opBinary(string s)(Type v) if (s == "/") { return vex3(x/Type(v  ), y/Type(v  ), z/Type(v  )); };
            vex3 opBinary(string s)(vex2 v) if (s == "/") { return vex3(x/Type(v.x), y/Type(v.y), z); };
            vex3 opBinary(string s)(vex3 v) if (s == "/") { return vex3(x/Type(v.x), y/Type(v.y), z/Type(v.z)); };
            vex3 opBinary(string s)(vex4 v) if (s == "/") { return vex3(x/Type(v.x), y/Type(v.y), z/Type(v.z)); };
            ref vex3 opOpAssign(string s)(Type v) if (s == "+") { x += Type(v  ); y += Type(v  ); Type(z += v); return this; };
            ref vex3 opOpAssign(string s)(vex2 v) if (s == "+") { x += Type(v.x); y += Type(v.x); return this; };
            ref vex3 opOpAssign(string s)(vex3 v) if (s == "+") { x += Type(v.x); y += Type(v.x); Type(z += v.z); return this; };
            ref vex3 opOpAssign(string s)(vex4 v) if (s == "+") { x += Type(v.x); y += Type(v.x); Type(z += v.z); return this; };
            ref vex3 opOpAssign(string s)(Type v) if (s == "-") { x -= Type(v  ); y -= Type(v  ); Type(z -= v); return this; };
            ref vex3 opOpAssign(string s)(vex2 v) if (s == "-") { x -= Type(v.x); y -= Type(v.y); return this; };
            ref vex3 opOpAssign(string s)(vex3 v) if (s == "-") { x -= Type(v.x); y -= Type(v.y); Type(z -= v.z); return this; };
            ref vex3 opOpAssign(string s)(vex4 v) if (s == "-") { x -= Type(v.x); y -= Type(v.y); Type(z -= v.z); return this; };
            ref vex3 opOpAssign(string s)(Type v) if (s == "*") { x *= Type(v  ); y *= Type(v  ); Type(z *= v); return this; };
            ref vex3 opOpAssign(string s)(vex2 v) if (s == "*") { x *= Type(v.x); y *= Type(v.y); return this; };
            ref vex3 opOpAssign(string s)(vex3 v) if (s == "*") { x *= Type(v.x); y *= Type(v.y); Type(z *= v.z); return this; };
            ref vex3 opOpAssign(string s)(vex4 v) if (s == "*") { x *= Type(v.x); y *= Type(v.y); Type(z *= v.z); return this; };
            ref vex3 opOpAssign(string s)(Type v) if (s == "/") { x /= Type(v  ); y /= Type(v  ); Type(z /= v); return this; };
            ref vex3 opOpAssign(string s)(vex2 v) if (s == "/") { x /= Type(v.x); y /= Type(v.y); return this; };
            ref vex3 opOpAssign(string s)(vex3 v) if (s == "/") { x /= Type(v.x); y /= Type(v.y); Type(z /= v.z); return this; };
            ref vex3 opOpAssign(string s)(vex4 v) if (s == "/") { x /= Type(v.x); y /= Type(v.y); Type(z /= v.z); return this; };
        }
        static if (is(Type == float) || is(Type == double)) {
            ref vex3 normalize() {
                const m = (x > y && x > z) ? x : (y > z) ? y : z;
                x /= m;
                y /= m;
                z /= m;
                return this;
		    };
            vex3 normalize() const {
                const m = (x > y && x > z) ? x : (y > z) ? y : z;
                return vex3(x/m, y/m, z/m);
		    };
		};
	};
    struct vex4 {
        Type x, y, z, w;
        this(Type v) { x = y = z = w = v; };
        this(Type _x, Type _y) { x = _x; y = _y; };
        this(Type _x, Type _y, Type _z) { x = _x; y = _y; z = _z; };
        this(Type _x, Type _y, Type _z, Type _w) { x = _x; y = _y; z = _z; w = _w; };
        this(vex2 v) { x = Type(v.x); y = Type(v.y); };
        this(vex3 v) { x = Type(v.x); y = Type(v.y); z = Type(v.z); };
        this(vex4 v) { x = Type(v.x); y = Type(v.y); z = Type(v.z); w = Type(v.w); };
        vex4 opCall() { return this; };
        bool opEquals(Type v) { return (x == Type(v  ) && y == Type(v) && z == Type(v) && w == Type(v)); };
        bool opEquals(vex2 v) { return (x == Type(v.x) && y == Type(v.y)); };
        bool opEquals(vex3 v) { return (x == Type(v.x) && y == Type(v.y) && z == Type(v.z)); };
        bool opEquals(vex4 v) { return (x == Type(v.x) && y == Type(v.y) && z == Type(v.z) && w == Type(v.w)); };
        ref Type opIndex(int v) { return (v % 4 == 0) ? x : (v % 4 == 1) ? y : (v % 4 == 2) ? z : w; };
        auto opIndex(string v1) {
            Type[] arr;
            foreach(i;v1) {
                if (i == 'x')
                    arr ~= x;
                else if (i == 'y')
                    arr ~= y;
                else if (i == 'z')
                    arr ~= z;
                else if (i == 'w')
                    arr ~= w;
			}
            return arr;
		};
        static if (is(Type == bool) == false) {
			vex4 opUnary(string s)() if (s == "-") { return vex4(-x, -y, -z, -w); };
            vex4 opBinary(string s)(Type v) if (s == "+") { return vex4(x+Type(v  ), y+Type(v  ), z+Type(v  ), w+Type(v)); };
            vex4 opBinary(string s)(vex2 v) if (s == "+") { return vex4(x+Type(v.x), y+Type(v.y), z, w); };
            vex4 opBinary(string s)(vex3 v) if (s == "+") { return vex4(x+Type(v.x), y+Type(v.y), z+Type(v.z), w); };
            vex4 opBinary(string s)(vex4 v) if (s == "+") { return vex4(x+Type(v.x), y+Type(v.y), z+Type(v.z), w+Type(v.w)); };
            vex4 opBinary(string s)(Type v) if (s == "-") { return vex4(x-Type(v  ), y-Type(v  ), z-Type(v  ), w-Type(v)); };
            vex4 opBinary(string s)(vex2 v) if (s == "-") { return vex4(x-Type(v.x), y-Type(v.y), z, w); };
            vex4 opBinary(string s)(vex3 v) if (s == "-") { return vex4(x-Type(v.x), y-Type(v.y), z-Type(v.z), w); };
            vex4 opBinary(string s)(vex4 v) if (s == "-") { return vex4(x-Type(v.x), y-Type(v.y), z-Type(v.z), w-Type(v.w)); };
            vex4 opBinary(string s)(Type v) if (s == "*") { return vex4(x*Type(v  ), y*Type(v  ), z*Type(v  ), w*Type(v  )); };
            vex4 opBinary(string s)(vex2 v) if (s == "*") { return vex4(x*Type(v.x), y*Type(v.y), z, w); };
            vex4 opBinary(string s)(vex3 v) if (s == "*") { return vex4(x*Type(v.x), y*Type(v.y), z*Type(v.z), w); };
            vex4 opBinary(string s)(vex4 v) if (s == "*") { return vex4(x*Type(v.x), y*Type(v.y), z*Type(v.z), w*Type(v.w)); };
            vex4 opBinary(string s)(Type v) if (s == "/") { return vex4(x/Type(v  ), y/Type(v  ), z/Type(v  ), w/Type(v  )); };
            vex4 opBinary(string s)(vex2 v) if (s == "/") { return vex4(x/Type(v.x), y/Type(v.y), z, w); };
            vex4 opBinary(string s)(vex3 v) if (s == "/") { return vex4(x/Type(v.x), y/Type(v.y), z/Type(v.z), w); };
            vex4 opBinary(string s)(vex4 v) if (s == "/") { return vex4(x/Type(v.x), y/Type(v.y), z/Type(v.z), w/Type(v.w)); };
            ref vex4 opOpAssign(string s)(Type v) if (s == "+") { x += Type(v  ); y += Type(v  ); z += Type(v); return this; };
            ref vex4 opOpAssign(string s)(vex2 v) if (s == "+") { x += Type(v.x); y += Type(v.x); return this; };
            ref vex4 opOpAssign(string s)(vex3 v) if (s == "+") { x += Type(v.x); y += Type(v.x); z += Type(v.z); return this; };
            ref vex4 opOpAssign(string s)(vex4 v) if (s == "+") { x += Type(v.x); y += Type(v.x); z += Type(v.z); w += Type(v.w); return this; };
            ref vex4 opOpAssign(string s)(Type v) if (s == "-") { x -= Type(v  ); y -= Type(v  ); z -= Type(v); w -= Type(v.w); return this; };
            ref vex4 opOpAssign(string s)(vex2 v) if (s == "-") { x -= Type(v.x); y -= Type(v.y); return this; };
            ref vex4 opOpAssign(string s)(vex3 v) if (s == "-") { x -= Type(v.x); y -= Type(v.y); z -= Type(v.z); return this; };
            ref vex4 opOpAssign(string s)(vex4 v) if (s == "-") { x -= Type(v.x); y -= Type(v.y); z -= Type(v.z); w -= Type(v.w); return this; };
            ref vex4 opOpAssign(string s)(Type v) if (s == "*") { x *= Type(v  ); y *= Type(v  ); z *= Type(v); w *= Type(v.w); return this; };
            ref vex4 opOpAssign(string s)(vex2 v) if (s == "*") { x *= Type(v.x); y *= Type(v.y); return this; };
            ref vex4 opOpAssign(string s)(vex3 v) if (s == "*") { x *= Type(v.x); y *= Type(v.y); z *= Type(v.z); return this; };
            ref vex4 opOpAssign(string s)(vex4 v) if (s == "*") { x *= Type(v.x); y *= Type(v.y); z *= Type(v.z); w *= Type(v.w); return this; };
            ref vex4 opOpAssign(string s)(Type v) if (s == "/") { x /= Type(v  ); y /= Type(v  ); z /= Type(v); w /= Type(v.w); return this; };
            ref vex4 opOpAssign(string s)(vex2 v) if (s == "/") { x /= Type(v.x); y /= Type(v.y); return this; };
            ref vex4 opOpAssign(string s)(vex3 v) if (s == "/") { x /= Type(v.x); y /= Type(v.y); z /= Type(v.z); return this; };
            ref vex4 opOpAssign(string s)(vex4 v) if (s == "/") { x /= Type(v.x); y /= Type(v.y); z /= Type(v.z); w /= Type(v.w); return this; };
        }
		static if (is(Type == float) || is(Type == double)) {
            ref vex4 normalize() {
                const m = (x > y && x > z && x > w) ? x : (y > z && y > w) ? y : (z > w) ? z : w;
                x /= m;
                y /= m;
                z /= m;
                w /= m;
                return this;
		    };
            vex4 normalize() const {
                const m = (x > y && x > z && x > w) ? x : (y > z && y > w) ? y : (z > w) ? z : w;
                return vex4(x/m, y/m, z/m, w/m);
		    };
		};
	};
};

alias vex2f = vex_t!(float).vex2;
alias vex3f = vex_t!(float).vex3;
alias vex4f = vex_t!(float).vex4;
alias vex2i = vex_t!(int).vex2;
alias vex3i = vex_t!(int).vex3;
alias vex4i = vex_t!(int).vex4;
alias vex2b = vex_t!(bool).vex2;
alias vex3b = vex_t!(bool).vex3;
alias vex4b = vex_t!(bool).vex4;
