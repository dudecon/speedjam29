from transformers import GPT2LMHeadModel, PreTrainedTokenizerFast
import torch

import emoji

import Book_gen


#control_parameters

export_destination = "output.txt"

model_path = 'C:/Users/lukes/Documents/GitHub/speedjam29/results/checkpoint-1000'  # gpt2 #wherever you saved your model









# Load your custom tokenizer
tokenizer = PreTrainedTokenizerFast(tokenizer_file="custom_emoji_tokenizer.json")
if tokenizer.pad_token is None:
    tokenizer.pad_token = tokenizer.eos_token  # Set pad_token to eos_token if not defined
    print("tokenizer adjusted")

model = GPT2LMHeadModel.from_pretrained(model_path, pad_token_id=tokenizer.pad_token_id)


def extend_text_emoji_sequence(input_text_emoji, max_new_tokens=5):
    input_ids = tokenizer.encode(input_text_emoji, return_tensors='pt')
    attention_mask = torch.ones(input_ids.shape, dtype=torch.long)
    output_ids = model.generate(
        input_ids,
        attention_mask=attention_mask,
        max_new_tokens=max_new_tokens,
        temperature=1.1,
        top_k=40,
        pad_token_id=tokenizer.pad_token_id,
        num_return_sequences=1,
        do_sample=True
    )
    return tokenizer.decode(output_ids[0], skip_special_tokens=True)

def respond_text_emoji_sequence(input_sequence, max_new_tokens=3):
    conversation = [input_sequence]

    generated = extend_emoji_sequence(input_sequence, max_new_tokens)
    response = generated[1 + len(conversation[-1]):]

    return response

def converse_text_emoji_sequence(subject, max_turns=10, max_new_tokens = 3):

    conversation = [subject]
    print("how this conversation started:\n" + conversation[0])

    conversation.append(respond_text_emoji_sequence(subject, max_new_tokens))


    for _ in range(max_turns - 1):
        
        prompt = subject + conversation[-1]
        print(prompt)
        response = respond_text_emoji_sequence(prompt, max_new_tokens)

        if not response:
            break


        conversation.append(response)


    conversation.append("\n")
    return conversation

def export_conversation(conversation, output_file=export_destination):
    with open(output_file, "a", encoding="utf-8") as f:
    # Write the emoji to the file in UTF-8 encoding
        for line in conversation:
            f.write(emoji.emojize(line) + "\n")

    f.close()

def export_text_emoji(text_emoji, output_file=export_destination):
    with open(output_file, "a", encoding="utf-8") as f:
        f.write(emoji.emojize(text_emoji) + "\n")





# Example input
# subject_text = ":man_farmer: :sunglasses: :seedling:"

convo_starters = Book_gen.Book().get_chapters()




if True:
    with open("output.txt", "w") as f:
        f.truncate()

for line in convo_starters:
    conversation = extend_text_emoji_sequence(emoji.demojize(line))
    export_text_emoji(conversation)
    print(conversation)


# for i in range(4):
#     conversation = converse_emoji_sequence(subject_text, 6, 10)
#     export_conversation(conversation)

