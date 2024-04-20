from transformers import GPT2LMHeadModel, PreTrainedTokenizerFast

# Load your custom tokenizer
tokenizer = PreTrainedTokenizerFast(tokenizer_file="custom_emoji_tokenizer.json")

# Load the GPT-2 model
model = GPT2LMHeadModel.from_pretrained('gpt2', pad_token_id=tokenizer.pad_token_id)



def generate_emoji_sequence(input_emoji, max_length=10):
    input_ids = tokenizer.encode(input_emoji, return_tensors='pt')
    output_ids = model.generate(input_ids, max_length=max_length)
    return tokenizer.decode(output_ids[0], skip_special_tokens=True)

def npc_conversation(start_input, turns=10, max_length=50):
    input_ids = tokenizer.encode(input_emoji, return_tensors='pt')
    output_ids = model.generate(input_ids, max_length=max_length)

    conversation = [start_input]
    print("how this conversation started:\n" + conversation[0])
    for _ in range(turns):
        
        next_input = generate_emoji_sequence(conversation[-1])

        conversation.append(next_input)
    return conversation

# Example input
input_emoji = ":man_farmer::sunglasses::seedling:"
print("Input to start of generation: " + input_emoji)
# Generate emoji sequence
extended_sequence = generate_emoji_sequence(input_emoji)
print("Extended Emoji Sequence:\n", extended_sequence)




# Start the conversation with an initial emoji sequence
conversation = npc_conversation(input_emoji)
print("npc_conversation from og_input: " + conversation)
for line in conversation:
    print(line)


