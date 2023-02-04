// This file contains custom types that can interop with
// Raylib and Jai's math library.

// This is optional and turned off by default unless
// the module parameter 'WITH_CUSTOM' is set to true.

Vec2 :: struct {
   #as using base: Vector2;

   #place base;
   #as jai: math.Vector2 = ---;
}

Vec3 :: struct {
   #as using base: Vector3;

   #place base;
   #as jai: math.Vector3 = ---;
}

Vec4 :: struct {
   #as using base: Vector4;

   #place base;
   xy: Vec2 = ---;
   wh: Vec2 = ---;

   #place base;
   #as jai: math.Vector4 = ---;

   #place base;
   #as rect: Rect = ---;
}

Rect :: struct {
   #as using base: Rectangle;

   #place base;
   xy: Vec2 = ---;
   wh: Vec2 = ---;

   #place base;
   #as jai: math.Vector4 = ---;
}

Mat4 :: struct {
   #as using base: Matrix;

   #place base;
   #as using jai: math.Matrix4 = ---;
}

Quat :: struct {
   #as using base: Quaternion;

   #place base;
   #as xyz: Vec3 = ---;

   #place base;
   #as jai: math.Quaternion = ---;
}

// Generate operator overloads and sanity checks
// for the custom types
#insert -> string {
   types :: Type.[
      Vec2, Vec3, Vec4,
      Rect, Mat4, Quat,
   ];

   operators :: string.[ "+", "-", "*", "/" ];

   b: String_Builder;
   for T: types {
      info := cast(*Type_Info_Struct)T;
      base := cast(*Type_Info_Struct)info.members[0].type;

      print_to_builder(*b, "\t\t\t// % operations\n", T);

      // Operator overloads
      for op: operators {
         print_to_builder(*b, #string END
         operator %1 :: (lhs: %2, rhs: %2) -> %2 {
            ret: %2 = ---;
            ret.jai = inline math.operator%1(lhs.jai, rhs.jai);
            return ret;
         }
         END, op, T);

         print_to_builder(*b, #string END
         operator %1 :: (lhs: %2, rhs: float) -> %2 {
            ret: %2 = ---;
         END, op, T);

         for base.members {
            print_to_builder(*b, #string END
            ret.%1 = lhs.%1 %2 rhs;
            END, it.name, op);
         }

         append(*b, #string END
            return ret;
         }

         END);
      }

      // Parity checks
      print_to_builder(*b, #string END
         // Parity checks for %
         #run {
      END, T);

      print_to_builder(*b, #string END
            inst: %;
      END, T);

      for base.members {
         print_to_builder(*b, #string END
            assert((cast(*void)*inst.%2) - (cast(*void)*inst) == %3, "%1.%2 has an unexpected offset of %% instead of %3", 0);
            assert(size_of(type_of(%1.%2)) == %4, "%1.%2 has an unexpected size of %% instead of %4", size_of(type_of(%1.%2)));

         END, T, it.name, it.offset_in_bytes, it.type.runtime_size);
      }

      print_to_builder(*b, #string END
            assert(size_of(%1) == size_of(type_of(inst.jai)), "%1 has an invalid size of %% instead of %2", size_of(%1));
         }

      END, T, base.runtime_size);
   }

   return builder_to_string(*b);
}

#scope_file;

#import "Basic";
#import "String";
math :: #import "Math";
