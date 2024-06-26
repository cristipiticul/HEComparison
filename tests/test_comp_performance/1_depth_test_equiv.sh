PRINT_HEADERS=1
BATCH_SIZE=4096
HELIB_M=$(( BATCH_SIZE * 4 ))
SEAL_N=$(( BATCH_SIZE * 2 ))
HELIB_BITS=119
HELIB_C=2
SEAL_MAX_LOG_Q=202 # For 128-bit security
SEAL_BIG_PRIMES_BITS=60
MAX_NR=1
HELIB_SCALE=5
TIMES_TO_SQUARE=4
./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
# ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
PRINT_HEADERS=0

SEAL_SCALE=20
TIMES_TO_SQUARE=4
SEAL_NUM_SMALL_PRIMES=$TIMES_TO_SQUARE
./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
# ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE

for HELIB_SCALE in 22 23 24 25
do
    for TIMES_TO_SQUARE in 1 2
    do
        ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
        # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
    done
done

SEAL_SCALE=40
TIMES_TO_SQUARE=2
SEAL_NUM_SMALL_PRIMES=$TIMES_TO_SQUARE
./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
# ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE

BATCH_SIZE=8192
HELIB_M=$(( BATCH_SIZE * 4 ))
SEAL_N=$(( BATCH_SIZE * 2 ))
SEAL_MAX_LOG_Q=411 # For 128-bit security
HELIB_SCALE=9
HELIB_C=6
HELIB_BITS=358
for TIMES_TO_SQUARE in {10..15}
do
    ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
    # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
done

SEAL_SCALE=25
for TIMES_TO_SQUARE in {10..15}
do
    SEAL_NUM_SMALL_PRIMES=$(( ( $SEAL_MAX_LOG_Q-(2*$SEAL_BIG_PRIMES_BITS) ) / $SEAL_SCALE ))
    SEAL_NUM_SMALL_PRIMES=$(( $SEAL_NUM_SMALL_PRIMES < $TIMES_TO_SQUARE ? $SEAL_NUM_SMALL_PRIMES : $TIMES_TO_SQUARE ))
    ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
    # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
done

HELIB_SCALE=24
TIMES_TO_SQUARE=7
./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
# ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C

SEAL_SCALE=40
TIMES_TO_SQUARE=7
SEAL_NUM_SMALL_PRIMES=$TIMES_TO_SQUARE
./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
# ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE

BATCH_SIZE=16384
HELIB_M=$(( BATCH_SIZE * 4 ))
SEAL_N=$(( BATCH_SIZE * 2 ))
SEAL_MAX_LOG_Q=827 # For 128-bit security
MAX_NR=1
HELIB_C=6
HELIB_BITS=717
HELIB_SCALE=8
for TIMES_TO_SQUARE in {10..12}
do
    ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
    # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
    PRINT_HEADERS=0
done
SEAL_SCALE=25
for TIMES_TO_SQUARE in {10..12}
do
    SEAL_NUM_SMALL_PRIMES=$(( ( $SEAL_MAX_LOG_Q - ( 2 * $SEAL_BIG_PRIMES_BITS ) ) / $SEAL_SCALE ))
    SEAL_NUM_SMALL_PRIMES=$(( $SEAL_NUM_SMALL_PRIMES < $TIMES_TO_SQUARE ? $SEAL_NUM_SMALL_PRIMES : $TIMES_TO_SQUARE ))
    ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
    # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
done


for HELIB_SCALE in 23 24
do
    for TIMES_TO_SQUARE in {17..18}
    do
        ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
        # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR helib $HELIB_M $HELIB_BITS $HELIB_SCALE $HELIB_C
        PRINT_HEADERS=0
    done
done
SEAL_SCALE=40
for TIMES_TO_SQUARE in {17..18}
do
    SEAL_NUM_SMALL_PRIMES=$(( ( $SEAL_MAX_LOG_Q - ( 2 * $SEAL_BIG_PRIMES_BITS ) ) / $SEAL_SCALE ))
    SEAL_NUM_SMALL_PRIMES=$(( $SEAL_NUM_SMALL_PRIMES < $TIMES_TO_SQUARE ? $SEAL_NUM_SMALL_PRIMES : $TIMES_TO_SQUARE ))
    ./1_power_raising $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
    # ./2_multiply_plain $TIMES_TO_SQUARE $PRINT_HEADERS $MAX_NR seal $SEAL_N $SEAL_BIG_PRIMES_BITS $SEAL_NUM_SMALL_PRIMES $SEAL_SCALE $SEAL_SCALE
done