template vex_t(Type) {
    struct vex2 {
        Type x, y;
        this(Type v) { x = y = v; };
        this(Type _x, Type _y) { x = _x; y = _y; };
        vex2 opCall() { return this; };
        vex2 opUnary(string s)() if (s == "-") { return vex2(-x, -y); };
        vex2 opBinary(string s)(Type v) if (s == "+") { return vex2(x+v, y+v); };
        vex2 opBinary(string s)(vex2 v) if (s == "+") { return vex2(x+v.x, y+v.y); };
        vex2 opBinary(string s)(Type v) if (s == "-") { return vex2(x-v, y-v); };
        vex2 opBinary(string s)(vex2 v) if (s == "-") { return vex2(x-v.x, y-v.y); };
        vex2 opBinary(string s)(Type v) if (s == "*") { return vex2(x*v, y*v); };
        vex2 opBinary(string s)(vex2 v) if (s == "*") { return vex2(x*v.x, y*v.y); };
        vex2 opBinary(string s)(Type v) if (s == "/") { return vex2(x/v, y/v); };
        vex2 opBinary(string s)(vex2 v) if (s == "/") { return vex2(x/v.x, y/v.y); };
        bool opEquals(Type v) { return (x == v && y == v); };
        bool opEquals(vex2 v) { return (x == v.x && y == v.y); };
        ref vex2 opOpAssign(string s)(Type v) if (s == "+") { x += v; y += v; return this; };
        ref vex2 opOpAssign(string s)(vex2 v) if (s == "+") { x += v.x; y += v.x; return this; };
        ref vex2 opOpAssign(string s)(Type v) if (s == "-") { x -= v; y -= v; return this; };
        ref vex2 opOpAssign(string s)(vex2 v) if (s == "-") { x -= v.x; y -= v.x; return this; };
        ref vex2 opOpAssign(string s)(Type v) if (s == "*") { x *= v; y *= v; return this; };
        ref vex2 opOpAssign(string s)(vex2 v) if (s == "*") { x *= v.x; y *= v.x; return this; };
        ref vex2 opOpAssign(string s)(Type v) if (s == "/") { x /= v; y /= v; return this; };
        ref vex2 opOpAssign(string s)(vex2 v) if (s == "/") { x /= v.x; y /= v.x; return this; };
        ref Type opIndex(int v) { return (v % 2 == 0) ? x : y; };
	};
    struct vex3 {
        Type x, y, z;
        this(Type v) { x = y = z = v; };
        this(Type _x, Type _y) { x = _x; y = _y; };
        this(Type _x, Type _y, Type _z) { x = _x; y = _y; z = _z; };
        vex3 opCall() { return this; };
        vex3 opUnary(string s)() if (s == "-") { return vex3(-x, -y, -z); };
        vex3 opBinary(string s)(Type v) if (s == "+") { return vex3(x+v, y+v, z+v); };
        vex3 opBinary(string s)(vex3 v) if (s == "+") { return vex3(x+v.x, y+v.y, z+v.z); };
        vex3 opBinary(string s)(Type v) if (s == "-") { return vex3(x-v, y-v, z-v); };
        vex3 opBinary(string s)(vex3 v) if (s == "-") { return vex3(x-v.x, y-v.y, z-v.z); };
        vex3 opBinary(string s)(Type v) if (s == "*") { return vex3(x*v, y*v, z*v); };
        vex3 opBinary(string s)(vex3 v) if (s == "*") { return vex3(x*v.x, y*v.y, z*v.z); };
        vex3 opBinary(string s)(Type v) if (s == "/") { return vex3(x/v, y/v, z/v); };
        vex3 opBinary(string s)(vex3 v) if (s == "/") { return vex3(x/v.x, y/v.y, z/v.z); };
        bool opEquals(Type v) { return (x == v && y == v && z == v); };
        bool opEquals(vex3 v) { return (x == v.x && y == v.y && z == v.z); };
        ref vex3 opOpAssign(string s)(Type v) if (s == "+") { x += v; y += v; z += v; return this; };
        ref vex3 opOpAssign(string s)(vex3 v) if (s == "+") { x += v.x; y += v.x; z += v.z; return this; };
        ref vex3 opOpAssign(string s)(Type v) if (s == "-") { x -= v; y -= v; z -= v; return this; };
        ref vex3 opOpAssign(string s)(vex3 v) if (s == "-") { x -= v.x; y -= v.y; z -= v.z; return this; };
        ref vex3 opOpAssign(string s)(Type v) if (s == "*") { x *= v; y *= v; z *= v; return this; };
        ref vex3 opOpAssign(string s)(vex3 v) if (s == "*") { x *= v.x; y *= v.y; z *= v.z; return this; };
        ref vex3 opOpAssign(string s)(Type v) if (s == "/") { x /= v; y /= v; z /= v; return this; };
        ref vex3 opOpAssign(string s)(vex3 v) if (s == "/") { x /= v.x; y /= v.y; z += v.z; return this; };
        ref Type opIndex(int v) { return (v % 3 == 0) ? x : (v % 3 == 1) ? y : z; };
	};
}

alias vex2f = vex_t!(float).vex2;
alias vex3f = vex_t!(float).vex3;
