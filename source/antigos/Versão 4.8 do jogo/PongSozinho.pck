GDPC                                                                            !   <   res://.import/ball.png-9a4ca347acb7532f6ae347744a6b04f7.stex`-      J       ¾ıQ�M�pw�qOr�<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�5      �      &�y���ڞu;>��.pD   res://.import/left_pallete.png-bc33611074a0f886142e37c77bd2545a.stex >      N       �0�^�R��(ͼ�JIL   res://.import/pixil-frame-0 (2).png-3518ea07d4b7b07323f6a64175fb6f0f.stex   0A      p      ����w�M�l���F�@   res://.import/preto.png-59ce61b46bbae8f984893f22d5b2967a.stex   pE      f       n̫��eÇ�o:z��H   res://.import/right_pallete.png-fc6e4a6a7c8197834656482b94708e47.stex   �H      N       �E�8��*���m�E��D   res://.import/separator.png-f981c8489b9148e2e1dc63398273da74.stex   �K      R       �Ap^��s"+���#   res://BarraD.gd.remap   �N      !       �X9���l��S�ڷ   res://BarraD.gdc 	      �      ������ѫ��dG��;   res://BarraD.tscn   �      =      ǧ�%-"������   res://BarraEsq.gd.remap �N      #       ����tm4��!�:�   res://BarraEsq.gdc         �      ����b �}���h   res://BarraEsq.tscn              �ү���k���"�Q�{   res://LevelPong.tscn       `	      �T��t/H.��
��5   res://NPC.gd.remap   O             ���Ԁ(���6�}�v   res://NPC.gdc   �      �      �$M�cx�y4�O��އ�   res://NPC.tscn        �      p�rك
o��%�����
   res://NovoLevelPong.gd.remap@O      (       �\z�7��
��6Ʉ��   res://NovoLevelPong.gdc �      q      	��*��CE��JD   res://NovoLevelPong.tscn`"      �
      �q�[iIИD6��6b�   res://ball.png.import   �-      �      �6�%��:�B:_���A   res://bola.gd.remap pO             ��,	��,����WD�   res://bola.gdc  `0      W      �4�[e�-�r$(a   res://bola.tscn �2            t�Ͷ�7��-�ͳ   res://default_env.tres  �4      �       um�`�N��<*ỳ�8   res://icon.png  �O      �      G1?��z�c��vN��   res://icon.png.import   p;      �      ��fe��6�B��^ U�    res://left_pallete.png.import   p>      �      TO�B�N@ș�Ks�$   res://pixil-frame-0 (2).png.import  �B      �      ���;���/&��}0�7   res://preto.png.import  �E      �      <��"\��~2�R�'   res://project.binary�\      >      %���G?J���q�A�9�    res://right_pallete.png.import  �H      �      @a��Z�k��2� �Р   res://separator.png.import   L      �      ����+2:tJH��;�        GDSC            k      ������������τ�   ���������ٶ�   ���׶���   �����϶�   ���������¶�   ��������Ӷ��   ���������������Ŷ���   ����׶��   �������������Ӷ�   �������������������ض���   �������ض���   ϶��            Bola          2                                                             	   %   
   3      4      :      K      W      Z      ]      a      d      g      h      i      3YY;�  Y;�  YY0�  PQV�  �  �  PQT�  P�  QYY0�  P�  QV�  �  P�  P�  R�	  PQQ�  QYY0�	  PQV�  &�  P�  T�
  T�  �
  T�  Q�  V�  &�  T�
  T�  �
  T�  V�  .�  �  (V�  .�  �  (V�  .�  YYY`    [gd_scene load_steps=3 format=2]

[ext_resource path="res://right_pallete.png" type="Texture" id=1]

[sub_resource type="CapsuleShape2D" id=1]
height = 104.0

[node name="BarraD" type="KinematicBody2D"]
position = Vector2( 662, 13 )

[node name="RightPallete" type="Sprite" parent="."]
position = Vector2( 219, 256 )
scale = Vector2( 2.96875, 3.98438 )
texture = ExtResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 220, 257 )
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}
   GDSC   
         @      ������������τ�   ���������ٶ�   ���������������Ŷ���   ����׶��   ���������Ӷ�   ��������   ����¶��   ����������������Ҷ��   ϶��   �������������Ӷ�   �        ui_up               ui_down                          	                         &   	   /   
   5      <      =      >      3YY;�  YY0�  P�  QV�  ;�  �  T�  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  �	  P�  �  Q�  �  Y`             [gd_scene load_steps=3 format=2]

[ext_resource path="res://left_pallete.png" type="Texture" id=1]

[sub_resource type="CapsuleShape2D" id=1]
radius = 13.0
height = 92.0

[node name="BarraEsq" type="KinematicBody2D"]

[node name="Sprite" type="Sprite" parent="."]
position = Vector2( 7, 33 )
scale = Vector2( 3.375, 3.8125 )
texture = ExtResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 7, 34 )
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}
  [gd_scene load_steps=8 format=2]

[ext_resource path="res://BarraD.tscn" type="PackedScene" id=1]
[ext_resource path="res://BarraEsq.tscn" type="PackedScene" id=2]
[ext_resource path="res://BarraEsq.gd" type="Script" id=3]
[ext_resource path="res://preto.png" type="Texture" id=4]
[ext_resource path="res://separator.png" type="Texture" id=5]
[ext_resource path="res://bola.tscn" type="PackedScene" id=6]
[ext_resource path="res://bola.gd" type="Script" id=7]

[node name="LevelPong" type="Node2D"]

[node name="Preto" type="Sprite" parent="."]
position = Vector2( 564, 333 )
scale = Vector2( 1.34131, 1.30782 )
texture = ExtResource( 4 )
__meta__ = {
"_edit_lock_": true
}

[node name="Separator" type="Sprite" parent="."]
position = Vector2( 512, 297 )
scale = Vector2( 3.49999, 1.64391 )
texture = ExtResource( 5 )
__meta__ = {
"_edit_lock_": true
}

[node name="PontosD" type="Label" parent="."]
margin_right = 40.0
margin_bottom = 14.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PontosEsq" type="Label" parent="."]
margin_right = 40.0
margin_bottom = 14.0
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Bola" parent="." instance=ExtResource( 6 )]
position = Vector2( 415, 225 )
script = ExtResource( 7 )

[node name="BarraD" parent="." instance=ExtResource( 1 )]
position = Vector2( 775, 3 )

[node name="BarraEsq" parent="." instance=ExtResource( 2 )]
position = Vector2( 42, 222 )
script = ExtResource( 3 )

[node name="topo" type="Area2D" parent="."]

[node name="CollisionPolygon2D" type="CollisionPolygon2D" parent="topo"]
polygon = PoolVector2Array( 1024, -7, 1025, -41, 8, -43, 8, -1, 364, -3 )

[node name="base" type="Area2D" parent="."]

[node name="CollisionPolygon2D" type="CollisionPolygon2D" parent="base"]
position = Vector2( 14, 634 )
polygon = PoolVector2Array( 1015, -10, 1016, -39, -2, -41, 10, 6 )

[node name="ladoD" type="Area2D" parent="."]

[node name="CollisionPolygon2D" type="CollisionPolygon2D" parent="ladoD"]
position = Vector2( 1038, 639 )
scale = Vector2( 0.089199, 16.4659 )
polygon = PoolVector2Array( 381.168, -1.88269, 269.06, -40.9938, -5, -42, -2, -1 )

[node name="ladoEsq" type="Area2D" parent="."]

[node name="CollisionPolygon2D" type="CollisionPolygon2D" parent="ladoEsq"]
position = Vector2( -153, 913 )
scale = Vector2( 0.148058, 24.1662 )
polygon = PoolVector2Array( 1024, -7, 1025, -41, 668.656, -39.6422, 574.099, -8.02775 )
GDSC            i      ������������τ�   ���������ٶ�   ���׶���   �����϶�   ���������¶�   ��������Ӷ��   ���������������Ŷ���   ����׶��   �������������Ӷ�   �������������������ض���   �������ض���   ϶��   �        Bola          2                                                             	   %   
   3      4      :      K      W      Z      ]      a      d      g      3YY;�  Y;�  YY0�  PQV�  �  �  PQT�  P�  QYY0�  P�  QV�  �  P�  P�  R�	  PQQ�  QYY0�	  PQV�  &�  P�  T�
  T�  �
  T�  Q�  V�  &�  T�
  T�  �
  T�  V�  .�  �  (V�  .�  �  (V�  .�  Y`      [gd_scene load_steps=3 format=2]

[ext_resource path="res://right_pallete.png" type="Texture" id=1]

[sub_resource type="CapsuleShape2D" id=1]
height = 100.0

[node name="NPC" type="KinematicBody2D"]

[node name="Sprite" type="Sprite" parent="."]
position = Vector2( 28, 62.5 )
scale = Vector2( 2.75, 3.90625 )
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 28, 63 )
shape = SubResource( 1 )
     GDSC            a      ���ӄ�   �������   ��������Ƕ��   �����������������������Ҷ���   ���϶���   ���׶���   �������ض���   ���������������������Ҷ�   �������Ŷ���   ����׶��   ���¶���          �     �                                                             	   #   
   '      (      )      *      1      =      A      B      I      S      ]      ^      _      3YY;�  Y;�  YYYY0�  P�  QV�  W�  T�  �  P�  R�  Q�  �  �  YYYY0�  P�  QV�  W�  T�  �  P�  R�  Q�  �  �  YY0�  P�	  QV�  W�  T�
  �>  P�  Q�  W�  T�
  �>  P�  QYYY`               [gd_scene load_steps=12 format=2]

[ext_resource path="res://bola.tscn" type="PackedScene" id=2]
[ext_resource path="res://BarraEsq.tscn" type="PackedScene" id=3]
[ext_resource path="res://BarraEsq.gd" type="Script" id=4]
[ext_resource path="res://bola.gd" type="Script" id=5]
[ext_resource path="res://preto.png" type="Texture" id=6]
[ext_resource path="res://separator.png" type="Texture" id=7]
[ext_resource path="res://NovoLevelPong.gd" type="Script" id=9]
[ext_resource path="res://NPC.gd" type="Script" id=10]
[ext_resource path="res://NPC.tscn" type="PackedScene" id=11]

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 10.5, 307.5 )

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 501, 10 )

[node name="LevelPongNovo" type="Node2D"]
script = ExtResource( 9 )

[node name="Preto" type="Sprite" parent="."]
position = Vector2( 564, 333 )
scale = Vector2( 1.34131, 1.30782 )
texture = ExtResource( 6 )
__meta__ = {
"_edit_lock_": true
}

[node name="Separator" type="Sprite" parent="."]
position = Vector2( 512, 297 )
scale = Vector2( 3.49999, 1.64391 )
texture = ExtResource( 7 )
__meta__ = {
"_edit_lock_": true
}

[node name="PontosD" type="Label" parent="."]
margin_left = 836.0
margin_top = 78.0
margin_right = 876.0
margin_bottom = 92.0
rect_scale = Vector2( 0.998743, 2.6779 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="PontosEsq" type="Label" parent="."]
margin_left = 140.0
margin_top = 74.0
margin_right = 180.0
margin_bottom = 88.0
rect_scale = Vector2( 1.00796, 2.76951 )
__meta__ = {
"_edit_use_anchors_": false
}

[node name="Bola" parent="." instance=ExtResource( 2 )]
position = Vector2( 415, 225 )
script = ExtResource( 5 )

[node name="BarraEsq" parent="." instance=ExtResource( 3 )]
position = Vector2( 53, 225 )
script = ExtResource( 4 )

[node name="NPC" parent="." instance=ExtResource( 11 )]
position = Vector2( 928, 93 )
script = ExtResource( 10 )

[node name="LadoD" type="Area2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="LadoD"]
position = Vector2( -4.5, 295.5 )
shape = SubResource( 2 )

[node name="LadoEsq" type="Area2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="LadoEsq"]
position = Vector2( 1034, 296 )
shape = SubResource( 2 )

[node name="topo" type="StaticBody2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="topo"]
position = Vector2( 512, 0 )
shape = SubResource( 1 )

[node name="base" type="StaticBody2D" parent="."]

[node name="CollisionShape2D" type="CollisionShape2D" parent="base"]
position = Vector2( 512, 596 )
shape = SubResource( 1 )

[connection signal="body_entered" from="LadoD" to="." method="_on_LadoD_body_entered"]
[connection signal="body_entered" from="LadoEsq" to="." method="_on_LadoEsq_body_entered"]
         GDST               .   WEBPRIFF"   WEBPVP8L   /�0��?���8�D��       [remap]

importer="texture"
type="StreamTexture"
path="res://.import/ball.png-9a4ca347acb7532f6ae347744a6b04f7.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://ball.png"
dest_files=[ "res://.import/ball.png-9a4ca347acb7532f6ae347744a6b04f7.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDSC            d      ������������τ�   ���������ٶ�   ���������Ӷ�   ��������   �����϶�   ζ��   ϶��   ���������������Ŷ���   ����׶��   ���������������¶���   ���������������Ӷ���   �����Ӷ�   �����ڶ�   �                �������?                         	                           	   -   
   ?      @      G      S      W      b      3YYY;�  Y;�  �  T�  YY0�  PQV�  �%  PQ�  �  T�  L�  R�  ML�&  PQ�  M�  �  T�  L�  R�  ML�&  PQ�  MYY0�  P�  QV�  ;�	  �
  P�  �  �  Q�  &�	  V�  �  �  T�  P�	  T�  QY`         [gd_scene load_steps=3 format=2]

[ext_resource path="res://pixil-frame-0 (2).png" type="Texture" id=1]

[sub_resource type="CircleShape2D" id=1]
radius = 24.0

[node name="Bola" type="KinematicBody2D"]

[node name="Ball" type="Sprite" parent="."]
position = Vector2( 161, 80 )
scale = Vector2( 1.54664, 1.42337 )
texture = ExtResource( 1 )
__meta__ = {
"_edit_lock_": true
}

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 99, 35 )
shape = SubResource( 1 )
__meta__ = {
"_edit_lock_": true
}
            [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              GDST                2   WEBPRIFF&   WEBPVP8L   /�0�1��#Ă�����3���  [remap]

importer="texture"
type="StreamTexture"
path="res://.import/left_pallete.png-bc33611074a0f886142e37c77bd2545a.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://left_pallete.png"
dest_files=[ "res://.import/left_pallete.png-bc33611074a0f886142e37c77bd2545a.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
      GDSTh  h           T  WEBPRIFFH  WEBPVP8L;  /g�YG@�mS����l
�6`�_�δPd��^ ��������q�_j$@���)�X�G{�Ԝ�����}J�_D�'������������9b&2��	Pa�c����Q�y��Ei�����kg��]D*F�:ͻH��tF���W��y�D��+ěT�n��>�A���-38=�/�>���'d}B޹�7FD>���r�ιHD�"�A�M�|�C��P��Ff��L󺉅�V�n��,gyɄγ�o"Հ�ND�{���Q�y4�J~�25@]4�Y��5@?N��_���W��������?c [remap]

importer="texture"
type="StreamTexture"
path="res://.import/pixil-frame-0 (2).png-3518ea07d4b7b07323f6a64175fb6f0f.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://pixil-frame-0 (2).png"
dest_files=[ "res://.import/pixil-frame-0 (2).png-3518ea07d4b7b07323f6a64175fb6f0f.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
       GDST   f           J   WEBPRIFF>   WEBPVP8L1   /�C� �H�f��o"���?��������?��������?���           [remap]

importer="texture"
type="StreamTexture"
path="res://.import/preto.png-59ce61b46bbae8f984893f22d5b2967a.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://preto.png"
dest_files=[ "res://.import/preto.png-59ce61b46bbae8f984893f22d5b2967a.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
           GDST                2   WEBPRIFF&   WEBPVP8L   /��?��#Ă�����3���  [remap]

importer="texture"
type="StreamTexture"
path="res://.import/right_pallete.png-fc6e4a6a7c8197834656482b94708e47.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://right_pallete.png"
dest_files=[ "res://.import/right_pallete.png-fc6e4a6a7c8197834656482b94708e47.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
   GDST   �           6   WEBPRIFF*   WEBPVP8L   /�c0��?��� ��i;���E���}a               [remap]

importer="texture"
type="StreamTexture"
path="res://.import/separator.png-f981c8489b9148e2e1dc63398273da74.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://separator.png"
dest_files=[ "res://.import/separator.png-f981c8489b9148e2e1dc63398273da74.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
               [remap]

path="res://BarraD.gdc"
               [remap]

path="res://BarraEsq.gdc"
             [remap]

path="res://NPC.gdc"
  [remap]

path="res://NovoLevelPong.gdc"
        [remap]

path="res://bola.gdc"
 �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name         PongSozinho    application/run/main_scene          res://NovoLevelPong.tscn   application/config/icon         res://icon.png  )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres    