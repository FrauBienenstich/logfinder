class LogFile
  attr_reader :size, :name
  UNITS = %W(B KiB MiB GiB TiB).freeze

  def initialize(pathname)
    @pathname = pathname
    @name = pathname.realpath.to_s
    @size = pathname.size
  end

  def as_human_readable(number)
    if number.to_i < 1024
      exponent = 0

    else
      max_exp  = UNITS.size - 1

      exponent = ( Math.log( number ) / Math.log( 1024 ) ).to_i # convert to base
      exponent = max_exp if exponent > max_exp # we need this to avoid overflow for the highest unit

      number  /= 1024 ** exponent
    end

    "#{number} #{UNITS[ exponent ]}"
  end

  def human_size
    as_human_readable(@size)
  end

end