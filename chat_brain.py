from transformers import GPT2LMHeadModel, PreTrainedTokenizerFast


import emoji


# Load your custom tokenizer
tokenizer = PreTrainedTokenizerFast(tokenizer_file="custom_emoji_tokenizer.json")

# Load the GPT-2 model
model = GPT2LMHeadModel.from_pretrained('gpt2', pad_token_id=tokenizer.pad_token_id)

def remove_prefix(text, prefix):
    if text.startswith(prefix):
        return text[len(prefix):]
    return text

def generate_emoji_sequence(input_emoji, max_new_tokens=5):
    input_ids = tokenizer.encode(input_emoji, return_tensors='pt')
    output_ids = model.generate(
        input_ids,
        max_new_tokens=max_new_tokens,
        temperature=1.2,
        top_k=40,
        pad_token_id=tokenizer.pad_token_id,
        num_return_sequences=1,
        do_sample=True
    )
    print(output_ids)
    return tokenizer.decode(output_ids[0], skip_special_tokens=True)

def npc_conversation(start_input, max_turns=10, max_new_tokens = 3):

    conversation = [start_input]
    print("how this conversation started:\n" + conversation[0])
    for _ in range(max_turns):
        
        generated = generate_emoji_sequence(conversation[-1], max_new_tokens)
        # print("before prefix removal: " + generated)
        response = generated[1 + len(conversation[-1]):]
        # print("after prefix removal:  " + response)

        if not response:
            break


        conversation.append(response)
    conversation.append("\n")
    return conversation

def export_conversation(conversation, output_file="output.txt"):
    with open(output_file, "a", encoding="utf-8") as f:
    # Write the emoji to the file in UTF-8 encoding
        for line in conversation:
            f.write(emoji.emojize(line) + "\n")

    f.close()


# Example input
subject_text = ":man_farmer: :sunglasses: :seedling:"


if True:
    with open("output.txt", "w") as f:x
        f.truncate()

for i in range(4):
    conversation = npc_conversation(subject_text, 6, 10)
    export_conversation(conversation)

