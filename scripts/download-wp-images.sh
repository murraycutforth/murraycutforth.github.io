#!/usr/bin/env bash
# Downloads all climb photos from the WordPress blog into their respective Hugo page bundle directories.
# Run from the repo root: bash scripts/download-wp-images.sh

set -euo pipefail

BASE="https://murraycutforth.wordpress.com/wp-content/uploads"
CONTENT="content/climbs"

download() {
  local url="$1"
  local dest="$2"
  local filename
  filename="$(basename "$url")"
  if [[ -f "$dest/$filename" ]]; then
    echo "  skip (exists): $filename"
  else
    echo "  downloading: $filename"
    curl -sSL "$url" -o "$dest/$filename"
  fi
}

# ── The Godfather (2023-12-01) ──────────────────────────────────────────────
DIR="$CONTENT/the-godfather"
download "$BASE/2023/12/img_0995.jpg"  "$DIR"
download "$BASE/2023/12/110516.jpeg"   "$DIR"
download "$BASE/2023/12/img_0980.jpg"  "$DIR"
download "$BASE/2023/12/img_0985.jpg"  "$DIR"
download "$BASE/2023/12/img_0991.jpg"  "$DIR"
download "$BASE/2023/12/img_0994.jpg"  "$DIR"
download "$BASE/2023/12/img_1008.jpg"  "$DIR"

# ── Hung, Drawn, and Quartered (2023-08-09) ─────────────────────────────────
DIR="$CONTENT/hung-drawn-and-quartered"
download "$BASE/2023/08/img_1833.jpg"  "$DIR"
download "$BASE/2023/08/img_1836.jpg"  "$DIR"
download "$BASE/2023/08/img_1834.jpg"  "$DIR"
download "$BASE/2023/08/img_1837.jpg"  "$DIR"
download "$BASE/2023/08/img_0955.jpg"  "$DIR"
download "$BASE/2023/08/img_0963.jpg"  "$DIR"
download "$BASE/2023/08/img_0969.jpg"  "$DIR"

# ── Rumplestiltskin (2023-04-24) ────────────────────────────────────────────
DIR="$CONTENT/rumplestiltskin"
download "$BASE/2023/04/img_0922.jpg"                                    "$DIR"
download "$BASE/2023/04/img_0919.jpg"                                    "$DIR"
download "$BASE/2023/04/img_0933.jpg"                                    "$DIR"
download "$BASE/2023/04/whatsapp-image-2023-03-06-at-12.37.101.jpeg"    "$DIR"

# ── Supersleuth (2023-04-17) ─────────────────────────────────────────────────
DIR="$CONTENT/supersleuth"
download "$BASE/2023/03/img_0655.jpg"                                                    "$DIR"
download "$BASE/2023/03/img_0646.jpg"                                                    "$DIR"
download "$BASE/2023/03/img_0650.jpg"                                                    "$DIR"
download "$BASE/2023/03/320433767_547344713906002_7433039984972690312_n.jpg"             "$DIR"
download "$BASE/2023/03/319154200_840369693839021_6879563804819725641_n1.jpg"            "$DIR"
download "$BASE/2023/03/img_0652.jpg"                                                    "$DIR"
download "$BASE/2023/03/img_0653.jpg"                                                    "$DIR"
download "$BASE/2023/03/img_0656.jpg"                                                    "$DIR"
download "$BASE/2023/03/img_0659.jpg"                                                    "$DIR"

# ── Nathrach Dubh (2023-04-14) ──────────────────────────────────────────────
DIR="$CONTENT/nathrach-dubh"
download "$BASE/2023/04/img_0892.jpg"  "$DIR"
download "$BASE/2023/04/img_0867.jpg"  "$DIR"
download "$BASE/2023/04/img_0887.jpg"  "$DIR"
download "$BASE/2023/04/img_0890.jpg"  "$DIR"
download "$BASE/2023/04/img_0899.jpg"  "$DIR"
download "$BASE/2023/04/img_0897.jpg"  "$DIR"
download "$BASE/2023/04/img_0906.jpg"  "$DIR"
download "$BASE/2023/04/img_0903.jpg"  "$DIR"

# ── The Gathering (2023-03-24) ──────────────────────────────────────────────
DIR="$CONTENT/the-gathering"
download "$BASE/2023/03/333397004_1194580837899943_9046072799810337229_n.jpg"  "$DIR"
download "$BASE/2023/03/331025356_579641254077205_8574707646015477043_n.jpg"   "$DIR"
download "$BASE/2023/03/330883445_541548367967879_7901183006671401019_n.jpg"   "$DIR"

# ── Raven's Edge (2023-01-25) ────────────────────────────────────────────────
DIR="$CONTENT/ravens-edge"
download "$BASE/2023/01/img_0744.jpg"  "$DIR"
download "$BASE/2023/01/img_0764.jpg"  "$DIR"
download "$BASE/2023/01/img_0746.jpg"  "$DIR"
download "$BASE/2023/01/img_0751.jpg"  "$DIR"
download "$BASE/2023/01/img_0757.jpg"  "$DIR"

# ── Slav Route (2022-08-05) ──────────────────────────────────────────────────
DIR="$CONTENT/slav-route"
download "$BASE/2022/06/275032433_843356323225555_5643483153105824881_n.jpg"   "$DIR"
download "$BASE/2022/06/img_3940.jpg"                                          "$DIR"
download "$BASE/2022/06/img_3937.jpg"                                          "$DIR"
download "$BASE/2022/06/275277339_2172644712884201_6974462138527079951_n.jpg"  "$DIR"
download "$BASE/2022/06/275074244_460800929168092_5979612528477451177_n.jpg"   "$DIR"
download "$BASE/2022/06/2d56ebf9-00d7-4b97-894b-87dd9cca6f88.jpg"             "$DIR"
download "$BASE/2022/06/img_3956.jpg"                                          "$DIR"
download "$BASE/2022/06/img_3952.jpg"                                          "$DIR"
download "$BASE/2022/06/img_3949.jpg"                                          "$DIR"
download "$BASE/2022/06/img_3957.jpg"                                          "$DIR"

# ── Ventricle (2022-06-22) ───────────────────────────────────────────────────
DIR="$CONTENT/ventricle"
download "$BASE/2022/02/273695640_10159589883102367_4659568077612402889_n.jpg"  "$DIR"
download "$BASE/2022/02/273666611_10159589882902367_806484561680375493_n.jpg"   "$DIR"
download "$BASE/2022/02/273454215_3205913186316336_4687898147711941152_n.jpg"   "$DIR"
download "$BASE/2022/02/273643985_1284063878745733_4199040741723301631_n.jpg"   "$DIR"
download "$BASE/2022/02/273710800_431011355473323_2787792552607316533_n.jpg"    "$DIR"
download "$BASE/2022/02/273886202_3082263068682091_8823073633416184233_n.jpg"   "$DIR"
download "$BASE/2022/02/273818776_1250737168749748_1933270462845228005_n.jpg"   "$DIR"
download "$BASE/2022/02/273604017_258792193104199_8276618103410522621_n.jpg"    "$DIR"

# ── Neanderthal (2022-03-30) ─────────────────────────────────────────────────
DIR="$CONTENT/neanderthal"
download "$BASE/2022/03/273689654_1338376220005162_1303224050026464355_n.jpg"  "$DIR"
download "$BASE/2022/03/273746118_3121614584787934_9161865685860902978_n.jpg"  "$DIR"
download "$BASE/2022/03/273171780_628314821564923_1302709965406568834_n.jpg"   "$DIR"
download "$BASE/2022/03/273442114_633622147921634_4051789290442275621_n.jpg"   "$DIR"
download "$BASE/2022/03/273648560_410400120883806_5462660945153246914_n.jpg"   "$DIR"
download "$BASE/2022/03/273600840_998161390786346_8185740698353729158_n.jpg"   "$DIR"

# ── Sioux Wall (2020-12-20) ──────────────────────────────────────────────────
DIR="$CONTENT/sioux-wall"
download "$BASE/2020/12/img_0792.jpg"  "$DIR"
download "$BASE/2020/12/pmz4755.jpg"   "$DIR"
download "$BASE/2020/12/pmz4805.jpg"   "$DIR"

# ── Un Poco Loco (2020-04-30) ────────────────────────────────────────────────
DIR="$CONTENT/un-poco-loco"
download "$BASE/2020/04/93644327_2281877482110432_4652821480021688320_n.jpg"  "$DIR"
download "$BASE/2020/04/img_20200118_140440.jpg"                               "$DIR"

# ── Auricle and Ventriloquist (2020-01-07) ───────────────────────────────────
DIR="$CONTENT/auricle-and-ventriloquist"
download "$BASE/2020/01/82117373_2543893162547681_397883528328511488_n.jpg"  "$DIR"
download "$BASE/2020/01/shakeout.gif"                                         "$DIR"
download "$BASE/2020/01/pb300638.jpg"                                         "$DIR"
download "$BASE/2020/01/pb300643.jpg"                                         "$DIR"
download "$BASE/2020/01/dsc00408-1.jpg"                                       "$DIR"
download "$BASE/2020/01/81442377_502982540423021_3799409717369896960_n.jpg"  "$DIR"

echo ""
echo "Done. All images downloaded."
