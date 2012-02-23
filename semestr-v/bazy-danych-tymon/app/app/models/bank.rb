class Bank
  class << self
    def transfer(from, to, amount)
      from.update_attributes(:balance => from.balance - amount)
      to.update_attributes(:balance => to.balance + amount)
    end

    def transfer_with_transaction(from, to, amount)
      Account.transaction do
        transfer(from, to, amount)
      end
    end
  end
end
